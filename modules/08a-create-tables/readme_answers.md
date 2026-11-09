# Module 08a — Create tables — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
IF OBJECT_ID('course_lab.clients', 'U') IS NOT NULL
    DROP TABLE course_lab.clients;

CREATE TABLE course_lab.clients
(
    id int,
    first_name varchar(50),
    last_name varchar(50)
);

SELECT * FROM course_lab.clients;   -- empty result
```

## Answer 2 — Answer

```sql
IF OBJECT_ID('tempdb..#tmp_table') IS NOT NULL
    DROP TABLE #tmp_table;

CREATE TABLE #tmp_table
(
    id int,
    title varchar(100),
    published_date int
);

SELECT name, create_date
FROM tempdb.sys.objects
WHERE name LIKE '#tmp_table%';
```

`CREATE TEMPORARY TABLE` is not T-SQL; use the `#` prefix. SQL Server pads the name in `tempdb`, so use `LIKE`.

## Answer 3 — Answer

```sql
IF OBJECT_ID('course_lab.long_film', 'U') IS NOT NULL
    DROP TABLE course_lab.long_film;

SELECT *
INTO course_lab.long_film
FROM film
WHERE length > 120;

SELECT COUNT(*) AS long_film_count FROM course_lab.long_film;
```

`CREATE TABLE ... AS` is MySQL/PostgreSQL syntax.

## Answer 4 — Answer

```sql
IF OBJECT_ID('tempdb..#tmp_actor_nick') IS NOT NULL
    DROP TABLE #tmp_actor_nick;

SELECT *
INTO #tmp_actor_nick
FROM actor
WHERE first_name = 'NICK';

SELECT actor_id, first_name, last_name FROM #tmp_actor_nick ORDER BY actor_id;
```

## Answer 5 — Answer

The query fails with `Invalid object name '#tmp_actor_nick'`. A `#` table is local to the session that created it and is dropped when that session ends. A `##` table is global to all sessions.
