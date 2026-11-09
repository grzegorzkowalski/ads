# Module 09a — Create views — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_clients
AS
SELECT customer_id, first_name, last_name
FROM dbo.customer;
GO

SELECT * FROM course_lab.v_clients ORDER BY customer_id;
```

## Answer 2 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_client_rentals
AS
SELECT
    r.rental_id,
    r.rental_date,
    r.return_date,
    c.first_name,
    c.last_name
FROM dbo.rental AS r
JOIN dbo.customer AS c ON c.customer_id = r.customer_id;
GO

SELECT TOP (10) * FROM course_lab.v_client_rentals ORDER BY rental_id;
```

## Answer 3 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_films_categories
AS
SELECT
    f.film_id,
    f.title,
    c.name AS category_name,
    f.release_year
FROM dbo.film AS f
JOIN dbo.film_category AS fc ON fc.film_id = f.film_id
JOIN dbo.category AS c ON c.category_id = fc.category_id;
GO

SELECT TOP (10) * FROM course_lab.v_films_categories ORDER BY film_id;
```

## Answer 4 — Answer

```sql
ALTER VIEW course_lab.v_clients
AS
SELECT customer_id, first_name, last_name, email
FROM dbo.customer;
GO

DROP VIEW course_lab.v_clients;
GO
```

`ALTER VIEW` (must exist) and `CREATE OR ALTER VIEW` (create or replace). `CREATE OR REPLACE VIEW` is not T-SQL.

## Answer 5 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_long_films
AS
SELECT film_id, title, length
FROM dbo.film
WHERE length > 120;
GO

DROP TABLE IF EXISTS course_lab.long_film_table;
SELECT film_id, title, length INTO course_lab.long_film_table FROM dbo.film WHERE length > 120;

DECLARE @film_id int = (SELECT TOP (1) film_id FROM course_lab.v_long_films ORDER BY film_id);

BEGIN TRANSACTION;
    UPDATE dbo.film SET length = 60 WHERE film_id = @film_id;

    SELECT COUNT(*) AS rows_in_view FROM course_lab.v_long_films;
    SELECT COUNT(*) AS rows_in_table FROM course_lab.long_film_table;
ROLLBACK TRANSACTION;
```

The view reflects the change immediately (one row fewer); the table is a snapshot and still has the old rows.
