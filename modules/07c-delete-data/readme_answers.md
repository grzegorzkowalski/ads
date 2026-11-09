# Module 07c — Delete data — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DELETE FROM course_lab.example_table
WHERE customer_id = 2;
```

## Answer 2 — Answer

```sql
DELETE FROM course_lab.example_table
WHERE last_name = 'Johnson';

INSERT INTO course_lab.example_table (first_name, last_name, email)
VALUES
    ('Grace', 'Anderson', 'grace.anderson@example.com'),
    ('Frank', 'White', 'frank.white@example.com'),
    ('Olivia', 'Turner', 'olivia.turner@example.com');

SELECT customer_id, first_name, last_name FROM course_lab.example_table ORDER BY customer_id;
```

The new rows continue from 8 — deleted IDs are not reused.

## Answer 3 — Answer

```sql
TRUNCATE TABLE course_lab.example_table;

INSERT INTO course_lab.example_table (first_name, last_name, email)
VALUES
    ('Liam', 'Smith', 'liam.smith@example.com'),
    ('Ava', 'Johnson', 'ava.johnson@example.com'),
    ('Lucas', 'Williams', 'lucas.williams@example.com');

SELECT customer_id, first_name FROM course_lab.example_table ORDER BY customer_id;
```

The IDs restart at 1.

## Answer 4 — Answer

| | `DELETE` | `TRUNCATE` |
|---|---|---|
| `WHERE` allowed | yes | no |
| Resets identity | no | yes |
| Logging | row by row | minimal (page deallocation) |
| Blocked by a foreign key referencing the table | only if child rows exist | always |

## Answer 5 — Answer

```sql
DELETE FROM film
WHERE title = 'Extended Adventure'
  AND description = 'A course-created test film.';
```

Real Sakila films are referenced by `inventory`, `film_actor`, and `film_category`; the foreign keys reject the delete.
