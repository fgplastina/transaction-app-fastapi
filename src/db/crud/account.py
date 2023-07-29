from sqlalchemy import func, select

from db.base import account, database, movement


async def get_current_balance(account_id: int):
    egress_balance_query = (
        select([func.coalesce(func.sum(movement.c.amount), 0)])
        .where(movement.c.id_account == account_id)
        .where(movement.c.type == "egress")
        .as_scalar()
    )
    egress_balance = await database.execute(query=egress_balance_query)

    ingress_balance_query = (
        select([func.coalesce(func.sum(movement.c.amount), 0)])
        .where(movement.c.id_account == account_id)
        .where(movement.c.type == "ingress")
        .as_scalar()
    )
    ingress_balance = await database.execute(query=ingress_balance_query)

    return ingress_balance - egress_balance


async def get(id: int):
    query = account.select().where(account.c.id == id)
    return await database.fetch_one(query=query)
