from typing import List

from fastapi import APIRouter, HTTPException, Path
from fastapi.responses import JSONResponse

from app.api.schemas import (
    CategoryClientSchema,
    ClientAccountsBalance,
    ClientDB,
    ClientDetailedSchema,
    ClientSchema,
)
from db.crud import client as client_crud

router = APIRouter()


@router.post("/", response_model=ClientDB, status_code=201)
async def create_client(payload: ClientSchema):
    client_id = await client_crud.post(payload)

    response_object = {
        "id": client_id,
        "name": payload.name,
    }
    return response_object


@router.get("/{id}/", response_model=ClientDB)
async def read_client(id: int = Path(..., gt=0)):
    client = await client_crud.get(id)
    if not client:
        return JSONResponse(status_code=404, content={"detail": "Client not found"})
    return client


@router.get("/", response_model=List[ClientDB])
async def read_all_clients():
    return await client_crud.get_all()


@router.put("/{id}/", response_model=ClientDB)
async def update_client(id: int, payload: ClientSchema):
    client = await client_crud.get(id)
    if not client:
        return JSONResponse(status_code=404, content={"detail": "Client not found"})

    client_id = await client_crud.put(id, payload)

    response_object = {
        "id": client_id,
        "name": payload.name,
    }
    return response_object


@router.delete("/{id}/", response_model=ClientDB)
async def delete_client(id: int):
    client = await client_crud.get(id)

    if not client:
        return JSONResponse(status_code=404, content={"detail": "Client not found"})

    await client_crud.delete(id)

    return client


@router.post(
    "/{client_id}/add_category/{category_id}", response_model=CategoryClientSchema
)
async def add_category_to_client(
    client_id: int,
    category_id: int,
):
    client_with_category = await client_crud.add_category_to_client(
        client_id, category_id
    )

    if client_with_category is None:
        raise HTTPException(status_code=404, detail="Cliente o categoría no encontrada")
    return client_with_category


@router.get("/{id}/detailed/", response_model=ClientDetailedSchema)
async def get_client_detailed(id: int):
    client = await client_crud.get_client_with_accounts_and_categories(id=id)
    print(client)
    if client is None:
        raise HTTPException(status_code=404, detail="Cliente no encontrado")
    return client


@router.get("/{id}/balance/", response_model=ClientAccountsBalance)
async def get_client_accounts_balance(id: int):
    client = await client_crud.get(id)
    if not client:
        raise HTTPException(status_code=404, detail="Cliente no encontrado")

    accounts_balance = await client_crud.get_client_accounts_balance(id)
    if accounts_balance is None:
        raise HTTPException(
            status_code=404, detail="El cliente no tiene cuentas asociadas"
        )

    return accounts_balance
