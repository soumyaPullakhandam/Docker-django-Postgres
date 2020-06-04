#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

#[ -f manage.py ] && echo "Found" || cd hello_django

# python3 manage.py collectstatic --no-input
# python3 manage.py migrate

docker-compose run --rm django hello_django/manage.py migrate
docker-compose run --rm django hello_django/manage.py collectstatic --no-input

#[ -f manage.py ] && cd .. || echo "Found"
#ls
exec "$@"