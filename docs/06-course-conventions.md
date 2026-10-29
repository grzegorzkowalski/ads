# Course conventions

## Naming

- SQL keywords are written in upper case.
- Table and column names use the existing lowercase Sakila names.
- New course objects use the `course_lab` schema.
- Primary keys are named `PK_<table>`.
- Foreign keys are named `FK_<table>_<referenced_table>`.
- Indexes are named `IX_<table>_<columns>`.

## Safe execution

- Never run destructive statements against `sakila` without a transaction or a reset plan.
- Use `TOP (1)` with a deterministic `ORDER BY` when selecting one row.
- Do not assume IDs are consecutive.
- Do not use `film.category_id`; categories are related through `film_category`.
- Do not invent orphan rows in the Sakila schema. Use the controlled `course_lab` tables for outer-join demonstrations.

## Answer format

Answers are stored in a separate `readme_answers.md` file next to each module or project. Student distributions should omit those files. Try each task first, then compare the reference solution and reasoning afterward.

## Expected SQL Server syntax

Use T-SQL constructs such as `TOP`, `DATEADD`, `DATEDIFF`, `TRY_CONVERT`, `STRING_AGG`, `SCOPE_IDENTITY`, and `THROW`. Do not use MySQL-only syntax such as `LIMIT`, backticks, or `GROUP_CONCAT`.

