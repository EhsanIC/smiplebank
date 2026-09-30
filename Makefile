createdb:
	set PGPASSWORD=root&& createdb --username=postgres --owner=postgres simple_bank

dropdb:
	set PGPASSWORD=root&& dropdb --username=postgres simple_bank

up:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5432/simple_bank?sslmode=disable" -verbose up

down:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test ./sqlc/ -v -cover -count=1 ./... 

.PHONY: createdb dropdb up down sqlc test
