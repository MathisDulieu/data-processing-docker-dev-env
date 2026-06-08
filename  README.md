# data-processing-docker-dev-env

Local development environment for the Data Processing Platform. Starts PostgreSQL and pgAdmin via Docker Compose.

## Requirements

- [Docker](https://www.docker.com/products/docker-desktop) >= 24
- [Docker Compose](https://docs.docker.com/compose/) >= 2

## Commands

```bash
# Start all services in background
docker compose up -d

# Stop and remove containers
docker compose down

# Stream logs from all services
docker compose logs -f

# Stream logs from a specific service
docker compose logs -f postgres

# Fully reset the environment including stored data
docker compose down -v && docker compose up -d
```

## Services

### PostgreSQL

| Property | Value |
|---|---|
| Host | `localhost` |
| Port | `5432` |
| User | `devuser` |
| Password | `devpassword` |
| Database | `dataprocessing` |

JDBC URL for the batch and API modules:
```
jdbc:postgresql://localhost:5432/dataprocessing
```

### pgAdmin

| Property | Value |
|---|---|
| URL | http://localhost:5050 |
| Email | `admin@local.dev` |
| Password | `admin` |

The PostgreSQL server is pre-registered automatically on first start. Open the URL, log in, and the `data-processing-local` server is ready to use in the left panel.

## Scripts

### Reset the database

Drops and recreates the `dataprocessing` database without touching the Docker volume:

```bash
bash scripts/reset-db.sh
```

### Restore a SQL dump

Restores a `.sql` dump file into the `dataprocessing` database:

```bash
bash scripts/import-dump.sh path/to/dump.sql
```