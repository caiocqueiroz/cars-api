#!/bin/bash


HOST="$DB_HOST"
PORT="$DB_PORT"
USER="$DB_USER"
PASS="$DB_PASSWORD"


until mysqladmin ping -h "$HOST" --port="$PORT" -u "$USER" -p"$PASS" --silent; do
  echo "Waiting for MySQL to be ready..."
  sleep 2
done

echo "MySQL is ready."

exec "$@"
