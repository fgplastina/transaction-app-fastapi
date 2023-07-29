from decimal import Decimal

import httpx


class Account:
    @classmethod
    async def get_balance_usd(cls, value: float) -> float:
        exchange_rate = await cls.exchange_rate()
        return round(value / exchange_rate, 2)

    @classmethod
    async def exchange_rate(cls):
        url = "https://www.dolarsi.com/api/api.php?type=valoresprincipales"

        async with httpx.AsyncClient() as client:
            response = await client.get(url)

            if response.status_code == 200:
                data = response.json()[4]["casa"]["compra"].replace(",", ".")
                return Decimal(data)
            else:
                raise ValueError("Failed to fetch data from the API")
