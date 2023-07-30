## Levantar el proyecto
Descargar el proyecto
```bash
git clone https://github.com/fgplastina/transaction-app-fastapi/
```
Build e inicio del docker-compose
```bash
docker-compose up -d
```

## Gestionar la base de datos por primera vez
###### Eliminar cualquier conexion a la DB
```bash
docker exec -it transaction-app-postgresql psql -U  postgres -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'transaction-appdb';"
```
###### Drop de la DB
```bash
docker exec -it transaction-app-postgresql psql -U  postgres -d postgres -c "DROP DATABASE \"transaction-appdb\";"
```
###### Crear la DB
```bash
docker exec -it transaction-app-postgresql psql -U postgres -d postgres -c "CREATE DATABASE \"transaction-appdb\";"
```
###### Cargar los datos en la DB
```bash
cat dump.sql | docker exec -i transaction-app-postgresql psql -U postgres -d transaction-appdb
```
## Visualizar los logs del server
```bash
docker attach transaction-app-fastapi
```
