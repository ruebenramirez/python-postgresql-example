
run-sql:
	#sudo docker compose build
	sudo docker compose up -d --build
	sudo docker compose logs python-client
