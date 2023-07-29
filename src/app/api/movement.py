from fastapi import APIRouter, HTTPException, Path
from fastapi.responses import JSONResponse

from app.api.schemas import MovementDB, MovementSchema
from db.crud import account as account_crud
from db.crud import movement as movement_crud

router = APIRouter()


@router.post("/", response_model=MovementDB, status_code=201)
async def create_movement(payload: MovementSchema):
    current_balance = await account_crud.get_current_balance(payload.id_account)

    if payload.type == "egress" and payload.amount > current_balance:
        error_msg = "No hay suficiente saldo en la cuenta para realizar el egreso."
        raise HTTPException(status_code=422, detail=error_msg)

    movement_id = await movement_crud.post(payload)
    created_movement = await movement_crud.get(movement_id)

    response_object = {
        "id": created_movement.id,
        "id_account": created_movement.id_account,
        "type": created_movement.type,
        "amount": created_movement.amount,
        "event_date": created_movement.event_date,
    }

    return response_object


@router.get("/{id}/", response_model=MovementDB)
async def read_movement(id: int = Path(..., gt=0)):
    movement = await movement_crud.get(id)
    if not movement:
        return JSONResponse(status_code=404, content={"reason": "Movimiento no encontrado"})
    return movement


@router.delete("/{id}/", response_model=MovementDB)
async def delete_movement(id: int):
    movement = await movement_crud.get(id)

    if not movement:
        return JSONResponse(status_code=404, content={"reason": "Movimiento no encontrado"})

    await movement_crud.delete(id)

    return movement
