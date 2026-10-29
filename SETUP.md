# ADS 2026 setup

## Recommended environment

| Component | Recommendation |
|---|---|
| Database engine | SQL Server 2022 inside Docker |
| Database image | `sakiladb/sqlserver:2022` |
| Windows runtime | Docker Desktop with WSL 2 backend |
| SQL client | VS Code with the `mssql` extension |
| Alternative SQL client | DataGrip |
| Host port | `1433` |
| Database | `sakila` |
| User | `sakila` |
| Password | `p_ssW0rd` |

VS Code and DataGrip are clients. They do not replace the SQL Server database engine. Docker runs the engine; the client sends T-SQL statements to it.

## Architecture

```text
VS Code / DataGrip
        |
        | TCP localhost:1433
        v
Docker container: ads2026-sakila
        |
        v
SQL Server 2022 -> database sakila
```

## Platform notes

The image is published for `amd64`. Windows and Linux machines with Intel/AMD processors are the primary supported platforms. On Apple Silicon, use a remote x86-64 SQL Server, a university VM, or another instructor-provided environment. Emulation may work, but it should not be the default course path.

## First-run checklist

- Docker Desktop is running.
- Port `1433` is free.
- The container reports `healthy`.
- A SQL client is installed.
- `sql/00_verify_environment.sql` runs successfully.
- You can see the `film`, `customer`, `rental`, and `payment` tables.

