import datetime
from typing import List, Literal

from pydantic import BaseModel


class ClientSchema(BaseModel):
    name: str


class ClientDB(ClientSchema):
    id: int


class AccountSchema(BaseModel):
    client_id: int


class AccountDB(AccountSchema):
    id: int


class MovementSchema(BaseModel):
    id_account: int
    type: Literal["egress", "ingress"]
    amount: float


class MovementDB(MovementSchema):
    id: int
    event_date: datetime.datetime


class CategorySchema(BaseModel):
    name: str


class CategoryDB(CategorySchema):
    id: int


class CategoryClientSchema(BaseModel):
    id_client: int
    id_category: int


class ClientDetailedSchema(ClientDB):
    accounts: List[AccountDB]
    categories: List[CategoryDB]

    class Config:
        from_attributes = True


class AccountBalanceSchema(BaseModel):
    id: int
    balance: float


class ClientAccountsBalance(BaseModel):
    id: int
    name: str
    accounts: List[AccountBalanceSchema]


class USDAccountSchema(AccountBalanceSchema):
    usd_balance: float
