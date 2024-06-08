makemigrations:
	pipenv run python ./multipledatabases/manage.py makemigrations

migrate:
	pipenv run python ./multipledatabases/manage.py migrate

start:
	pipenv run python ./multipledatabases/manage.py runserver 0.0.0.0:8000

initadmin:
	pipenv run python ./multipledatabases/manage.py initadmin