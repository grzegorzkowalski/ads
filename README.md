# Advanced SQL Server with Sakila — ADS 2026

This is the new English-language version of the advanced database course.

You will work as a data engineer for **Sakila Video**, a fictional video-rental business. The course starts with a reproducible SQL Server environment and progresses from basic queries to data modelling, transactions, stored procedures, performance tuning, and a final project.

## Learning outcomes

By the end of the course, you will be able to:

- query a relational database with production-quality T-SQL;
- explain primary keys, foreign keys, constraints, and many-to-many relationships;
- write safe `INSERT`, `UPDATE`, and `DELETE` statements;
- use joins, aggregation, subqueries, CTEs, and window functions;
- create views, stored procedures, and functions;
- handle errors and transactions with `TRY...CATCH`;
- design indexes and interpret execution plans;
- normalize a denormalized model to 3NF;
- apply least-privilege security and database roles;
- reason about concurrent transactions and isolation;
- work with JSON data in SQL Server;
- test, document, and package a database change;
- document and present a database solution.

## Start here

1. Read [SETUP.md](SETUP.md).
2. Install the tools listed in [docs/01-tools.md](docs/01-tools.md).
3. Start the database by following [docs/02-docker.md](docs/02-docker.md).
4. Connect with VS Code or DataGrip using [docs/03-vscode.md](docs/03-vscode.md) or [docs/04-datagrip.md](docs/04-datagrip.md).
5. Run [sql/00_verify_environment.sql](sql/00_verify_environment.sql).
6. Run [sql/02_course_smoke_tests.sql](sql/02_course_smoke_tests.sql).
7. Read [docs/06-course-conventions.md](docs/06-course-conventions.md).
8. Complete the modules in order.

## Course map

| Module | Topic |
|---|---|
| 01 | Selecting and exploring data |
| 02 | Filtering, `NULL`, `CASE`, and operators |
| 03 | Sorting, grouping, and `HAVING` |
| 03a | Filtering groups with `HAVING` |
| 03b | Grouping functions and saving results |
| 04 | Inner, outer, and many-to-many joins |
| 05 | Subqueries, CTEs, and window functions |
| 06 | Dates, text, and data types |
| 06a | Date functions |
| 06b | String functions |
| 06c | Data types, `CAST`, and `CONVERT` |
| 07 | Inserting, updating, and deleting safely |
| 07a | Insert data |
| 07b | Update data |
| 07c | Delete data and `TRUNCATE` |
| 08 | Tables, keys, and constraints |
| 08a | Create tables (permanent, temporary, `SELECT INTO`) |
| 08b | Alter tables |
| 08c | Drop tables |
| 08d | Primary keys |
| 08e | Foreign keys |
| 08f | Constraints |
| 08g | Database design |
| 09 | Views and reporting models |
| 09a | Create views |
| 10 | Transactions and error handling |
| 10a | Transactions |
| 10b | `TRY...CATCH` |
| 11 | Stored procedures and functions |
| 11a | Stored procedures |
| 12 | Indexes, execution plans, and normalization |
| 12a | Query optimization |
| 13 | Security and database permissions |
| 14 | Concurrency and isolation |
| 15 | JSON and semi-structured data |
| 16 | Testing, deployment, and delivery |
| 17 | Optional MongoDB track |

## Projects

- [Project 1 — Sakila Business Investigation](projects/01-business-investigation/README.md)
- [Project 2 — Awards and Directors Extension](projects/02-schema-extension/README.md)
- [Project 3 — Final Capstone Delivery](projects/03-capstone-delivery/README.md)
- [Final completion checklist](FINAL-CHECKLIST.md)
- [Optional MongoDB track](modules/17-mongodb/README.md)

## Important safety rule

The container is a disposable training environment. Do not use these credentials or this image for production systems. Before destructive exercises, read [docs/05-reset-and-troubleshooting.md](docs/05-reset-and-troubleshooting.md).

## Source and runtime

The course uses the preloaded `sakiladb/sqlserver:2022` image. The image provides SQL Server 2022 and the Sakila database with 16 tables and 7 views. Docker Hub currently maps this tag to the `v2022.0.3` Sakila release. The image is published under the BSD 2-Clause license; see the image documentation for provenance and release details:

<https://hub.docker.com/r/sakiladb/sqlserver>

