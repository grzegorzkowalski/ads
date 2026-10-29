# What was fixed in ADS 2026

## Environment

- The course now starts with tools, Docker, connection details, and verification.
- The database engine is consistently Microsoft SQL Server 2022.
- The preloaded `sakiladb/sqlserver:2022` image is used instead of asking students to convert MySQL scripts. Its current Sakila release is `v2022.0.3`, but Docker Hub exposes it through the `2022` tag.
- VS Code and DataGrip are documented as clients, not database engines.

## Exercise quality

- The repeated `11.*` numbering and missing module numbering are replaced by twelve ordered modules.
- Explanations use one language: English.
- Answers are kept outside the learner-facing README files in separate `readme_answers.md` files.
- Destructive work is clearly marked and can be reset by recreating the container.
- SQL Server syntax is used consistently: `TOP`, `TRY_CONVERT`, `STRING_AGG`, `SCOPE_IDENTITY`, and `THROW`.

## Data model correctness

- Category analysis always uses `film_category`; the Sakila `film` table does not contain `category_id`.
- The payment/customer outer-join exercise is a data-quality check whose expected result is zero rows in a valid database.
- Unmatched `RIGHT JOIN` and `FULL OUTER JOIN` examples use controlled `course_lab` tables rather than corrupting Sakila referential integrity.
- New `film_id` foreign keys use `INT`, matching the SQL Server Sakila image.
- Junction tables use composite primary keys to prevent duplicate relationships.

## Project quality

- The directors-and-awards project includes ten directors and five awards.
- The film-awards view includes the category relationship.
- The stored procedure can assign an award to a film, a director, or both.
- The function supports film and director award counts.
- The optional trigger must look up the default award instead of assuming `award_id = 1`.
- Acceptance tests, indexing requirements, and an assessment rubric are included.

## Scope

The MongoDB material is now a separate optional module. It has its own Docker Compose file, seed script, exercises, and answer file, so it does not mix MongoDB commands into the SQL Server learning path.

