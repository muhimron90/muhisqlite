
build:
	@go build -o bin .

dev:
	@go run .

db-status:
	@GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING="./muhi.db" goose -dir="migrations" status

up:
	@GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING="./muhi.db" goose -dir="migrations" up

reset:
	@GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING="./muhi.db" goose -dir="migrations" reset

clean:
	@go clean
	$(RM) -r bin/*
