from fastapi import APIRouter

from app.api import account, client, movement


router = APIRouter()

router.include_router(client.router, prefix="/clients", tags=["clients"])
router.include_router(movement.router, prefix="/movements", tags=["movements"])
router.include_router(account.router, prefix="/accounts", tags=["accounts"])
