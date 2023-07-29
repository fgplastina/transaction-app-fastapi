import json

import pytest

from db import crud


### POST TEST
def test_create_client(test_app, monkeypatch):
    test_request_payload = {"name": "Juan Perez"}
    test_response_payload = {"id": 1, "name": "Juan Perez"}

    async def mock_post(payload):
        return 1

    monkeypatch.setattr(crud, "post", mock_post)

    response = test_app.post(
        "/clients/",
        content=json.dumps(test_request_payload),
    )

    assert response.status_code == 201
    assert response.json() == test_response_payload


def test_create_client_invalid_json(test_app):
    response = test_app.post("/clients/", content=json.dumps({"named": "Juan Perez"}))
    assert response.status_code == 422


### GET TEST
def test_read_client(test_app, monkeypatch):
    test_data = {"id": 1, "name": "Juan Pablo"}

    async def mock_get(id):
        return test_data

    monkeypatch.setattr(crud, "get", mock_get)

    response = test_app.get("/clients/1")
    assert response.status_code == 200
    assert response.json() == test_data


def test_read_client_incorrect_id(test_app, monkeypatch):
    async def mock_get(id):
        return None

    monkeypatch.setattr(crud, "get", mock_get)

    response = test_app.get("/clients/999")
    assert response.status_code == 404
    assert response.json()["detail"] == "Cliente no encontrado"


def test_read_all_clients(test_app, monkeypatch):
    test_data = [
        {"name": "something", "id": 1},
        {"name": "someone", "id": 2},
    ]

    async def mock_get_all():
        return test_data

    monkeypatch.setattr(crud, "get_all", mock_get_all)

    response = test_app.get("/clients/")
    assert response.status_code == 200
    assert response.json() == test_data


### PUT TEST
def test_update_client(test_app, monkeypatch):
    test_update_data = {"name": "someone", "id": 1}

    async def mock_get(id):
        return True

    monkeypatch.setattr(crud, "get", mock_get)

    async def mock_put(id, payload):
        return 1

    monkeypatch.setattr(crud, "put", mock_put)

    response = test_app.put("/clients/1/", content=json.dumps(test_update_data))
    assert response.status_code == 200
    assert response.json() == test_update_data


@pytest.mark.parametrize(
    "id, payload, status_code",
    [
        [1, {}, 422],
        [999, {"name": "foo"}, 404],
    ],
)
def test_update_client_invalid(test_app, monkeypatch, id, payload, status_code):
    async def mock_get(id):
        return None

    monkeypatch.setattr(crud, "get", mock_get)

    response = test_app.put(
        f"/clients/{id}/",
        content=json.dumps(payload),
    )
    assert response.status_code == status_code


### DELETE TEST
def test_remove_client(test_app, monkeypatch):
    test_data = {"name": "something", "id": 1}

    async def mock_get(id):
        return test_data

    monkeypatch.setattr(crud, "get", mock_get)

    async def mock_delete(id):
        return id

    monkeypatch.setattr(crud, "delete", mock_delete)

    response = test_app.delete("/clients/1/")
    assert response.status_code == 200
    assert response.json() == test_data


def test_remove_client_incorrect_id(test_app, monkeypatch):
    async def mock_get(id):
        return None

    monkeypatch.setattr(crud, "get", mock_get)

    response = test_app.delete("/clients/999/")
    assert response.status_code == 404
    assert response.json()["detail"] == "Cliente no encontrado"
