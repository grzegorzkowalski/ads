# Module 01 — Explore the catalogue — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Exercise 1 — Select unique categories

```sql
SELECT DISTINCT
    name AS category_name
FROM category
ORDER BY name;
```

## Exercise 2 — Inspect recent films

```sql
SELECT
    title,
    release_year,
    length,
    rental_duration,
    rental_rate,
    rating
FROM film
WHERE TRY_CONVERT(int, release_year) > 2005
ORDER BY TRY_CONVERT(int, release_year), title;
```

## Exercise 3 — Inspect payment columns

```sql
SELECT
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    last_update
FROM payment;
```

