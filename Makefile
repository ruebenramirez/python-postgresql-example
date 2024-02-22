
run-sql:
	docker compose rm -f
	docker compose up -d --build
	docker compose up python-client
