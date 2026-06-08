#!/usr/bin/env bash
set -euo pipefail

CONTAINER="data-processing-postgres"
USER="devuser"
DB="dataprocessing"

echo "Resetting database '$DB'..."

docker exec "$CONTAINER" psql -U "$USER" -d postgres -c "DROP DATABASE IF EXISTS $DB;"
docker exec "$CONTAINER" psql -U "$USER" -d postgres \
  -c "CREATE DATABASE $DB WITH OWNER = $USER ENCODING = 'UTF8' TEMPLATE = template0;"
docker exec "$CONTAINER" psql -U "$USER" -d "$DB" \
  -c "GRANT ALL PRIVILEGES ON SCHEMA public TO $USER;"

echo "Done."