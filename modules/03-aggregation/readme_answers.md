# Module 03 — Turn rows into business metrics — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC, customer_id;
```

## Answer 2 — Answer

```sql
SELECT
    rental_id,
    rental_date,
    return_date,
    customer_id
FROM rental
ORDER BY
    CASE WHEN return_date IS NULL THEN 1 ELSE 0 END,
    return_date,
    rental_date DESC,
    rental_id;
```

## Answer 3 — Answer

```sql
SELECT
    customer_id,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_paid
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 30
   AND SUM(amount) > 200
ORDER BY total_paid DESC;
```

## Answer 4 — Answer

```sql
SELECT
    c.name AS category_name,
    AVG(CAST(f.length AS decimal(10, 2))) AS average_length
FROM category AS c
JOIN film_category AS fc ON fc.category_id = c.category_id
JOIN film AS f ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY average_length DESC, category_name;
```

## Answer 5 — Answer

```sql
SELECT
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(*) AS film_count
FROM actor AS a
JOIN film_actor AS fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) >= 35
ORDER BY film_count DESC, actor_name;
```


