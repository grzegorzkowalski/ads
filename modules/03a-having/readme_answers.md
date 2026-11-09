# Module 03a — Filter groups with HAVING — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 10
   AND COUNT(*) < 20
ORDER BY rental_count, customer_id;
```

The rentals are in the `rental` table.

## Answer 2 — Answer

```sql
SELECT
    customer_id,
    COUNT(rental_id) AS rental_count
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) >= 5
ORDER BY rental_count DESC, customer_id;
```

## Answer 3 — Answer

```sql
SELECT
    customer_id,
    COUNT(payment_id) AS payment_count,
    SUM(amount) AS total_paid
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 30
   AND SUM(amount) > 200
ORDER BY total_paid DESC, customer_id;
```

## Answer 4 — Answer

```sql
SELECT
    actor_id,
    COUNT(film_id) AS film_count
FROM film_actor
GROUP BY actor_id
HAVING COUNT(film_id) >= 35
ORDER BY film_count DESC, actor_id;
```

## Answer 5 — Answer

```sql
SELECT
    customer_id,
    SUM(amount) AS total_paid
FROM payment
WHERE amount > 1          -- row level, before grouping
GROUP BY customer_id
HAVING SUM(amount) > 50   -- group level, after aggregation
ORDER BY total_paid DESC, customer_id;
```

`WHERE` removes individual payments before they are summed. `HAVING` filters after `SUM` has been calculated.

## Reflection — Answer

`WHERE` runs before `GROUP BY`, when no sums exist yet. Only `HAVING` can test an aggregate result.
