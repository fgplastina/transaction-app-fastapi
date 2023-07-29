from re import A

from pydantic import parse_obj_as
from sqlalchemy import case, func, select

from app.api.schemas import (
    AccountBalanceSchema,
    AccountDB,
    CategoryDB,
    ClientAccountsBalance,
    ClientDetailedSchema,
    ClientSchema,
)
from db.base import account, category, category_client, client, database, movement


async def post(payload: ClientSchema):
    query = client.insert().values(name=payload.name)
    return await database.execute(query=query)


async def get(id: int):
    query = client.select().where(id == client.c.id)
    return await database.fetch_one(query=query)


async def get_all():
    query = client.select()
    return await database.fetch_all(query=query)


async def put(id: int, payload: ClientSchema):
    query = (
        client.update()
        .where(id == client.c.id)
        .values(name=payload.name)
        .returning(client.c.id)
    )
    return await database.execute(query=query)


async def delete(id: int):
    query = client.delete().where(id == client.c.id)
    return await database.fetch_one(query=query)


async def get_categories(id: int):
    query = category.select().where(client_id=id)
    return await database.execute(query=query)


async def get_client_with_accounts_and_categories(id: int):
    client_query = select([client.c.id, client.c.name]).where(client.c.id == id)

    account_query = select([account.c.id, account.c.id_client]).where(
        account.c.id_client == id
    )

    category_query = (
        select([category.c.id, category.c.name])
        .select_from(client.join(category_client).join(category))
        .where(client.c.id == id)
    )

    client_result = await database.fetch_one(query=client_query)
    account_results = await database.fetch_all(query=account_query)
    category_results = await database.fetch_all(query=category_query)

    client_data = ClientDetailedSchema(
        id=client_result["id"],
        name=client_result["name"],
        accounts=[
            AccountDB(id=account["id"], client_id=account["id_client"])
            for account in account_results
        ],
        categories=[
            CategoryDB(id=category["id"], name=category["name"])
            for category in category_results
        ],
    )

    return client_data


async def add_category_to_client(client_id: int, category_id: int):
    client_query = client.select().where(client_id == client.c.id)
    client_obj = await database.fetch_one(query=client_query)
    if not client_obj:
        return None

    category_query = category.select().where(category_id == category.c.id)
    category_obj = await database.fetch_one(query=category_query)
    if not category_obj:
        return None

    query = category_client.insert().values(
        id_client=client_obj.id, id_category=category_obj.id
    )

    result = await database.execute(query=query)

    return {"id_client": client_obj.id, "id_category": category_obj.id}


async def get_client_accounts_balance(id: int):
    subquery = (
        select(
            [
                movement.c.id_account,
                func.coalesce(
                    func.sum(
                        case(
                            [
                                (movement.c.type == "egress", -movement.c.amount),
                                (movement.c.type == "ingress", movement.c.amount),
                            ],
                            else_=0,
                        )
                    ),
                    0,
                ).label("balance"),
            ]
        )
        .group_by(movement.c.id_account)
        .subquery()
    )

    query = (
        select(
            [
                client.c.id.label("client_id"),
                client.c.name.label("client_name"),
                account.c.id.label("account_id"),
                func.coalesce(subquery.c.balance, 0).label("balance"),
            ]
        )
        .select_from(
            client.join(account).outerjoin(
                subquery, account.c.id == subquery.c.id_account
            )
        )
        .where(client.c.id == id)
        .group_by(client.c.id, client.c.name, account.c.id, subquery.c.balance)
    )

    result = await database.fetch_all(query=query)
    if result:
        accounts_balance = []
        for row in result:
            account_data = AccountBalanceSchema(
                id=row["account_id"], balance=row["balance"]
            )
            accounts_balance.append(account_data)

        client_balance = ClientAccountsBalance(
            id=result[0]["client_id"],
            name=result[0]["client_name"],
            accounts=accounts_balance,
        )
    else:
        client_balance = None

    return client_balance
