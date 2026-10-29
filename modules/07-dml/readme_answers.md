# Module 07 — Change data safely — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DECLARE @english_language_id tinyint =
(
    SELECT TOP (1) language_id
    FROM language
    WHERE name = 'English'
    ORDER BY language_id
);

INSERT INTO film
(
    title, description, release_year, language_id,
    rental_duration, rental_rate, length, replacement_cost, rating
)
OUTPUT inserted.film_id, inserted.title
VALUES
(
    'Extended Adventure',
    'A course-created test film.',
    '2026',
    @english_language_id,
    5,
    4.99,
    150,
    19.99,
    'PG'
);
```

## Answer 2 — Answer

```sql
BEGIN TRANSACTION;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id = 15;

UPDATE actor
SET first_name = 'Robert'
WHERE actor_id = 15;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id = 15;

ROLLBACK TRANSACTION;
```

## Answer 3 — Answer

```sql
DELETE FROM film
WHERE title = 'Extended Adventure'
  AND description = 'A course-created test film.';
```

The condition is intentionally narrow. A real deletion may still fail if related inventory, category, actor, or rental rows exist.


