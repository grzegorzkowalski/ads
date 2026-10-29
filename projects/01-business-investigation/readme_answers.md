# Project 1 — Sakila Business Investigation — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Reference answer

```sql
SELECT TOP (10)
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(p.payment_id) AS payment_count,
    SUM(p.amount) AS total_revenue
FROM customer AS c
JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_revenue DESC, c.customer_id;
```

## Answer 2 — Reference answer

```sql
SELECT TOP (10)
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id
LEFT JOIN rental AS r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC, f.title;
```

## Answer 3 — Reference answer

```sql
SELECT f.film_id, f.title
FROM film AS f
WHERE NOT EXISTS
(
    SELECT 1
    FROM inventory AS i
    JOIN rental AS r ON r.inventory_id = i.inventory_id
    WHERE i.film_id = f.film_id
)
ORDER BY f.title;
```

## Answer 4 — Reference answer

```sql
SELECT
    c.name AS category_name,
    SUM(p.amount) AS total_revenue
FROM payment AS p
JOIN rental AS r ON r.rental_id = p.rental_id
JOIN inventory AS i ON i.inventory_id = r.inventory_id
JOIN film_category AS fc ON fc.film_id = i.film_id
JOIN category AS c ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_revenue DESC, category_name;
```

## Answer 5 — Reference answer

```sql
SELECT p.payment_id, p.customer_id
FROM payment AS p
LEFT JOIN customer AS c ON c.customer_id = p.customer_id
WHERE c.customer_id IS NULL;
```


