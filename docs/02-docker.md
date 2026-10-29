# Start and manage the Sakila Docker container

Open a terminal in the `ads2026` directory.

## Windows prerequisite: Docker Engine must be running

If Docker prints an error such as:

```text
failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine
```

the Docker CLI is installed, but the Docker Engine is not currently available. This is not a Sakila image or SQL Server error.

1. Start **Docker Desktop** from the Windows Start menu.
2. Wait until Docker Desktop reports that the engine is running.
3. In the Docker Desktop tray menu, select **Switch to Linux containers** if the menu currently offers that option. The Sakila image is a Linux container image.
4. Verify the connection:

```powershell
docker info
docker context ls
```

The active context should normally be `desktop-linux`. If Docker Desktop is running but another context is active, select it explicitly:

```powershell
docker context use desktop-linux
```

If `docker info` still cannot connect, restart Docker Desktop. As a further WSL 2 recovery step, close Docker Desktop, run `wsl --shutdown`, start Docker Desktop again, and wait for the engine to become ready.

## Start the database

```powershell
docker compose up -d
```

The image contains the Sakila database. You do not need to download or import separate schema and data scripts.

## Check the container

```powershell
docker compose ps
docker inspect -f '{{.State.Health.Status}}' ads2026-sakila
```

The health status should become `healthy`. The first startup may take a few seconds because SQL Server restores the database inside the container.

## Stop and restart

```powershell
docker compose stop
docker compose start
```

## Reset the disposable lab

To remove the container and recreate a clean Sakila environment:

```powershell
docker compose down
docker compose up -d
```

Do not add a persistent volume unless your instructor explicitly asks for one. The disposable-container model is intentional: it protects the reference data from destructive exercises.

## Inspect logs

```powershell
docker compose logs --tail 100 sakila
```

## Common port alternative

If port `1433` is already used, change the host side only:

```yaml
ports:
  - "11433:1433"
```

Then connect to port `11433`. The port inside the container remains `1433`.

