#!/bin/sh


echo "Waiting for mysql..."

while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
  sleep 0.1
done

echo "MySQL started"

echo "Waiting for mongo..."

while ! nc -z mongo 27017; do
  sleep 0.1
done

echo "Mongo started"

pipenv run python ./multipledatabases/manage.py makemigrations
pipenv run python ./multipledatabases/manage.py migrate
pipenv run python ./multipledatabases/manage.py initadmin

exec "$@"