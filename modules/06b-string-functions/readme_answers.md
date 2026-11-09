# Module 06b — String functions — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    film_id,
    CONCAT('Movie: ', title) AS prefixed_title
FROM film
ORDER BY film_id;
```

The legacy task used `UPDATE film SET title = ...`; a report should never rewrite source data. `CONCAT` also treats `NULL` as an empty string.

## Answer 2 — Answer

```sql
SELECT
    film_id,
    title,
    LEFT(title, 10) AS first_10_characters
FROM film
ORDER BY film_id;
```

## Answer 3 — Answer

```sql
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
ORDER BY customer_id;
```

## Answer 4 — Answer

```sql
SELECT TOP (20)
    customer_id,
    UPPER(last_name) AS last_name_upper,
    LOWER(first_name) AS first_name_lower,
    LEN(CONCAT(first_name, ' ', last_name)) AS full_name_length
FROM customer
ORDER BY customer_id;
```

## Answer 5 — Answer

```sql
SELECT
    LTRIM(RTRIM('   Sakila Video   ')) AS trimmed_value,
    SUBSTRING(LTRIM(RTRIM('   Sakila Video   ')), 1, 6) AS first_six;
```

`LEN` ignores trailing spaces but not leading ones.
