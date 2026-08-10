# Grocy

Self-hosted household ERP — "ERP beyond your fridge". Food inventory, shopping list, meal planning, recipes, chores, and tasks, with all data stored on your own server.

- Site: https://grocy.info
- Repo: https://github.com/grocy/grocy
- Demo: https://demo.grocy.info

## What we use it for

- Food inventory with expiration dates
- Shared shopping list (family adds items from their phones)
- Meal planning
- Price tracking

## Access

- URL: http://homelab.pi:9283
- Default login: `admin` / `admin` — change the password on first entry
- REST API with Swagger UI at `/api`

## Deployment

Runs via `linuxserver/grocy` (nginx + PHP-FPM) on port `9283`. See `docker-compose.yml`.

- Data lives in a SQLite database inside `./config`, so it survives container updates.
- TZ: `America/Monterrey`

## Backup

1. Stop the container first.
2. Copy the `config` folder to the backup location (e.g. `/mnt/hdd-backup/grocy/<date>`).
3. Restore = copy `config` back and start the container.

Do NOT copy the `.db` file while the container is running — SQLite WAL can produce a corrupt backup.

## Update

```sh
docker compose pull && docker compose up -d
```
