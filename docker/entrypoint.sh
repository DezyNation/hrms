#!/bin/bash
set -e

echo "Starting Horilla HR..."

# (Optional) wait if DB is slow
sleep 2

# Apply existing migrations only
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

echo "Starting server..."
exec "$@"
