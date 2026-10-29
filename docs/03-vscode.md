# Connect with Visual Studio Code

## Install the extension

1. Open VS Code.
2. Open **Extensions**.
3. Search for **mssql**.
4. Install the Microsoft SQL Server extension.
5. Open any `.sql` file from the `ads2026` folder.

## Create the connection

1. Press `Ctrl+Shift+P`.
2. Run **MS SQL: Connect**.
3. Choose **Create connection profile**.
4. Enter:

```text
Server: localhost,1433
Database: sakila
Authentication: SQL Login
User: sakila
Password: p_ssW0rd
Trust server certificate: Yes
```

If you changed the host port in Docker Compose, use `localhost,<your-host-port>`.

## Run a query

Open a SQL file, select a statement, and press `Ctrl+Shift+E`.

```sql
SELECT TOP (10)
    film_id,
    title,
    release_year,
    rental_rate
FROM film
ORDER BY title;
```

## Select the database context

The database selector in the editor should show `sakila`. If IntelliSense does not show tables, reconnect and select the correct database context.

