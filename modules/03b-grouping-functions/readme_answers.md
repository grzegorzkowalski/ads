# Module 03b — Grouping functions — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_customer_payment_report
AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(p.payment_id) AS payment_count,
    SUM(p.amount) AS total_amount,
    AVG(p.amount) AS average_amount,
    MAX(p.payment_date) AS last_payment_date
FROM dbo.customer AS c
JOIN dbo.payment AS p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;
GO

SELECT TOP (10) *
FROM course_lab.v_customer_payment_report
ORDER BY total_amount DESC, customer_id;
```

Group by `customer_id`, not only by name: two customers can share a name.

## Answer 2 — Answer

```sql
IF OBJECT_ID('tempdb..#tmp_film_actors') IS NOT NULL
    DROP TABLE #tmp_film_actors;

SELECT
    f.film_id,
    f.title,
    COUNT(fa.actor_id) AS actor_count
INTO #tmp_film_actors
FROM film AS f
LEFT JOIN film_actor AS fa ON fa.film_id = f.film_id
GROUP BY f.film_id, f.title;

SELECT TOP (10) * FROM #tmp_film_actors ORDER BY actor_count DESC, film_id;
```

## Answer 3 — Answer

```sql
IF OBJECT_ID('tempdb..#tmp_film_rentals') IS NOT NULL
    DROP TABLE #tmp_film_rentals;

SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS rental_count
INTO #tmp_film_rentals
FROM film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id
LEFT JOIN rental AS r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id, f.title;

SELECT TOP (10) * FROM #tmp_film_rentals ORDER BY rental_count DESC, film_id;
```

## Answer 4 — Answer

```sql
SELECT
    c.name AS category_name,
    AVG(CAST(f.length AS decimal(10, 2))) AS average_length
FROM film AS f
JOIN film_category AS fc ON fc.film_id = f.film_id
JOIN category AS c ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY average_length DESC, category_name;
```

`film.category_id` does not exist; categories come through `film_category`.
