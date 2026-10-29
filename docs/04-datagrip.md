# Connect with DataGrip

## Create a data source

1. Open **File → New → Data Source → Microsoft SQL Server**.
2. Download the Microsoft JDBC driver if DataGrip asks for it.
3. Enter:

```text
Host: localhost
Port: 1433
Database: sakila
User: sakila
Password: p_ssW0rd
Authentication: User & Password
```

4. Click **Test Connection**.
5. Open the **Schemas** tab and select the `sakila` database.
6. Open a query console with `F4`.

If you changed the host port in Docker Compose, use that port instead of `1433`.

## Run the verification script

Open `sql/00_verify_environment.sql`, attach it to the `sakila` data source, and run it.

## Important DataGrip setting

Keep credentials in the dedicated connection fields. Do not place the password in a shared JDBC URL or commit it to the repository.

