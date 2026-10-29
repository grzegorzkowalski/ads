# Reset and troubleshooting

## Container is not healthy

Run:

```powershell
docker compose ps
docker compose logs --tail 150 sakila
```

Wait a few seconds after the first start. If the problem persists, recreate the disposable container:

```powershell
docker compose down
docker compose up -d
```

## Port 1433 is busy

Find the process using the port, or change the host port in `docker-compose.yml` to `11433:1433`. The SQL client must then use port `11433`.

## Login fails

Confirm that:

- the container is `healthy`;
- the database is `sakila`;
- the username is `sakila`;
- the password is `p_ssW0rd`;
- the SQL client is using SQL Login authentication;
- **Trust server certificate** is enabled for local development.

## Tables are not visible

Reconnect to the `sakila` database. In DataGrip, refresh the data source and select the schema. In VS Code, select `sakila` in the database dropdown.

## I damaged the data

This is expected during some exercises. Use:

```powershell
docker compose down
docker compose up -d
```

The image restores a clean Sakila database at startup.

## Apple Silicon

The course image is published for `amd64`. Prefer a remote or virtualized x86-64 SQL Server environment rather than making emulation the standard student path.

