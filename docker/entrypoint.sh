#!/bin/bash

echo "Starting Horilla HR..."

# wait a bit for DB
sleep 5

echo "Running migrations (will not crash if failed)..."
python manage.py migrate --noinput || echo "⚠️ Migration failed, continuing startup..."

echo "Collecting static files (will not crash if failed)..."
python manage.py collectstatic --noinput || echo "⚠️ Collectstatic failed, continuing..."

echo "Starting server..."
exec "$@"
