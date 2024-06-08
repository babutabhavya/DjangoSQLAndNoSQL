makemigrations:
	docker-compose run --rm django pipenv run python ./multipledatabases/manage.py makemigrations

migrate:
	docker-compose run --rm django pipenv run python ./multipledatabases/manage.py migrate

start:
	docker-compose up --build