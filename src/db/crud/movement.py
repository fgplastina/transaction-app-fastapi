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


# async def post(payload: MovementSchema):
#    balance_query = (
#        select([func.coalesce(func.sum(movement.c.amount), 0)])
#        .where(movement.c.id_account == payload.id_account)
#        .as_scalar()
#    )
#    current_balance = await database.execute(query=balance_query)
#
#    # Validar saldo suficiente para egreso
#    if payload.type == "egress" and payload.amount > current_balance:
#        raise ValueError("No hay suficiente saldo en la cuenta para realizar el egreso.")
#
#    # Insertar el movimiento si pasa la validación de saldo
#    query = movement.insert().values(
#        id_account=payload.id_account,
#        amount=payload.amount,
#        type=payload.type,
#        event_date=datetime.now(),
#    )
#    try:
#        return await database.execute(query=query)
#    except IntegrityError as e:
#        raise ValueError("Error al insertar el movimiento.") from e
