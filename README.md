### Levantar el proyecto
docker-compose up -d

#### Cargar el dump
docker-compose exec -it transaction-app-postgresql psql -U postgres -d transaction-appdb -f backup.sql

#### Ver los logs del server
docker attach transaction-app-fastapi
