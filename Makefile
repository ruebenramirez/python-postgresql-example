
run-sql:
	docker compose rm -f
	docker compose up --build
	docker compose logs python-client
	docker compose down -v
