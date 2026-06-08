#!/usr/bin/env bash
set -euo pipefail

CONTAINER="data-processing-postgres"
USER="devuser"
DB="dataprocessing"

if [[ -z "${1:-}" ]]; then
  echo "Usage: bash scripts/import-dump.sh path/to/dump.sql"
  exit 1
fi

DUMP_FILE="$1"

if [[ ! -f "$DUMP_FILE" ]]; then
  echo "Error: file not found: $DUMP_FILE"
  exit 1
fi

echo "Importing '$DUMP_FILE' into '$DB'..."
docker exec -i "$CONTAINER" psql -U "$USER" -d "$DB" < "$DUMP_FILE"
echo "Done."