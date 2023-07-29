from datetime import datetime

from app.api.schemas import MovementSchema
from db.base import database, movement


async def post(payload: MovementSchema):
    query = movement.insert().values(
        id_account=payload.id_account,
        amount=payload.amount,
        type=payload.type,
        event_date=datetime.now(),
    )
    return await database.execute(query=query)


async def get(id: int):
    query = movement.select().where(id == movement.c.id)
    return await database.fetch_one(query=query)


async def delete(id: int):
    query = movement.delete().where(id == movement.c.id)
    return await database.fetch_one(query=query)
