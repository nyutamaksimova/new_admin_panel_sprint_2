#!/usr/bin/env bash

set -e

chown www-data:www-data /var/log

python3 manage.py collectstatic --noinput
python3 manage.py migrate --noinput

python3 manage.py createsuperuser --noinput || true

uwsgi --strict --ini /opt/app/uwsgi.ini
