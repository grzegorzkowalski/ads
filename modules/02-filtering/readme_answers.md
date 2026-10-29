# Module 02 — Find the right records — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT category_id, name
FROM category
WHERE name IN ('Animation', 'Family', 'Children')
ORDER BY name;
```

## Answer 2 — Answer

```sql
SELECT film_id, title, length
FROM film
WHERE length BETWEEN 90 AND 120
ORDER BY length, title;
```

## Answer 3 — Answer

```sql
SELECT
    film_id,
    title,
    release_year,
    rental_duration
FROM film
WHERE title LIKE 'A%'
  AND TRY_CONVERT(int, release_year) BETWEEN 2005 AND 2010
  AND rental_duration IN (4, 5, 7)
ORDER BY title;
```

## Answer 4 — Answer

```sql
SELECT rental_id, customer_id, inventory_id, rental_date
FROM rental
WHERE return_date IS NULL
ORDER BY rental_date;
```


