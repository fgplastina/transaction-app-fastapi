import os

from databases import Database
from sqlalchemy import (
    Column,
    DateTime,
    ForeignKey,
    Integer,
    MetaData,
    Numeric,
    String,
    Table,
    create_engine,
)
from sqlalchemy.orm import foreign
from sqlalchemy.sql import func

DATABASE_URL = os.getenv("DATABASE_URL")

# SQLAlchemy
engine = create_engine(DATABASE_URL)
metadata = MetaData()

client = Table(
    "client",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String(50)),
)

account = Table(
    "account",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("id_client", ForeignKey("client.id")),
)

movement = Table(
    "movement",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("id_account", ForeignKey("account.id")),
    Column("type", String(50)),
    Column("amount", Numeric(precision=12, scale=2), nullable=False),
    Column("event_date", DateTime, nullable=False),
)


category_client = Table(
    "category_client",
    metadata,
    Column("id_category", ForeignKey("category.id")),
    Column("id_client", ForeignKey("client.id")),
)

category = Table(
    "category",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String(50)),
)

# databases query builder
database = Database(DATABASE_URL)
