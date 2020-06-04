#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# if [ -f manage.py ];
# then
#   echo "Found"
# else
#   cd hello_django
# fi

# python3 manage.py collectstatic --no-input
# python3 manage.py migrate


# if [ -f manage.py ]
# then
#   cd ..
# else 
#   echo "Found"
# fi

ls

exec "$@"