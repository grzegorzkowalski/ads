# Module 05 — Ask layered questions — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT film_id, title, length
FROM film
WHERE length > (SELECT AVG(CAST(length AS decimal(10, 2))) FROM film)
ORDER BY length DESC, title;
```

## Answer 2 — Answer

```sql
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customer AS c
WHERE EXISTS
(
    SELECT 1
    FROM rental AS r
    WHERE r.customer_id = c.customer_id
      AND r.return_date IS NULL
)
ORDER BY customer_name;
```

## Answer 3 — Answer

```sql
WITH customer_revenue AS
(
    SELECT customer_id, SUM(amount) AS total_revenue
    FROM payment
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank, customer_id;
```

## Answer 4 — Answer

```sql
WITH ranked_films AS
(
    SELECT
        c.name AS category_name,
        f.title,
        f.rental_rate,
        ROW_NUMBER() OVER
        (
            PARTITION BY c.category_id
            ORDER BY f.rental_rate DESC, f.title
        ) AS category_position
    FROM category AS c
    JOIN film_category AS fc ON fc.category_id = c.category_id
    JOIN film AS f ON f.film_id = fc.film_id
)
SELECT category_name, title, rental_rate, category_position
FROM ranked_films
WHERE category_position <= 3
ORDER BY category_name, category_position;
```


