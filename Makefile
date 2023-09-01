postgres:
	docker run --name bank_services -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=modupe4816 -d postgres:15.1-alpine

createdb:
	docker exec -it bank_services createdb --username=root --owner=root bankdb

.PHONY: postgres createdb

