from fastapi import FastAPI

from app.api import account, client, movement
from db.base import database, engine, metadata

metadata.create_all(engine)

app = FastAPI()


@app.on_event("startup")
async def startup():
    await database.connect()


@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()


app.include_router(client.router, prefix="/clients", tags=["clients"])
app.include_router(movement.router, prefix="/movements", tags=["movements"])
app.include_router(account.router, prefix="/accounts", tags=["accounts"])
