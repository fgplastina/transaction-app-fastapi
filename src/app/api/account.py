from fastapi import APIRouter
from fastapi.responses import JSONResponse

from app.api.schemas import USDAccountSchema
from app.models import Account
from db.crud import account as account_crud

router = APIRouter()


@router.get("/{id}/usd/", response_model=USDAccountSchema)
async def get_account_balance_to_usd(id: int):
    account = await account_crud.get(id)

    if not account:
        JSONResponse(status_code=404, content="detail: Account not found")

    balance = await account_crud.get_current_balance(id)

    usd_balance = await Account().get_balance_usd(balance)

    response_object = {
        "id": account.id,
        "balance": balance,
        "usd_balance": usd_balance,
    }
    return response_object
