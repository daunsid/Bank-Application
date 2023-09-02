postgres:
	docker run --name bankService -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=modupe4816 -d postgres:15.1-alpine

createdb:
	docker exec -it bankService createdb --username=postgres --owner=postgres bankdb

dropdb:
	docker exec -it bankService dropdb bankdb

migrateup:
	migrate -path db/migration -database "postgresql://postgres:modupe4816@localhost:5432/bankdb?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:modupe4816@localhost:5432/bankdb?sslmode=disable" --verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc

