
run-sql:
	docker compose up -d --build
	docker compose up python-client
	docker compose rm -f
