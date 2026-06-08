#!/usr/bin/env bash
set -euo pipefail

CONTAINER="data-processing-postgres"
USER="devuser"
DB="dataprocessing"

echo "Seeding test files into '$DB'..."
docker exec -i "$CONTAINER" psql -U "$USER" -d "$DB" < "$(dirname "$0")/seed-test-files.sql"
echo "Done."