# Module 06 — Make data usable — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    customer_id,
    first_name,
    last_name,
    create_date,
    DATEPART(year, create_date) AS registration_year,
    DATEPART(month, create_date) AS registration_month,
    DATEPART(day, create_date) AS registration_day
FROM customer
ORDER BY create_date, customer_id;
```

## Answer 2 — Answer

```sql
SELECT
    customer_id,
    CONCAT(last_name, ', ', first_name) AS display_name
FROM customer
ORDER BY last_name, first_name;
```

## Answer 3 — Answer

```sql
SELECT film_id, title, description
FROM film
WHERE LOWER(CAST(description AS nvarchar(max))) LIKE '%robot%'
   OR title LIKE 'A%'
ORDER BY title;
```

## Answer 4 — Answer

```sql
SELECT
    film_id,
    title,
    release_year AS raw_release_year,
    TRY_CONVERT(int, release_year) AS release_year_number
FROM film
ORDER BY release_year_number, title;
```


