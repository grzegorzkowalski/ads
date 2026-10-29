# Module 09 — Build reusable reporting views — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
USE sakila;
GO

CREATE OR ALTER VIEW course_lab.v_customer_directory
AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    ci.city,
    co.country
FROM dbo.customer AS c
JOIN dbo.address AS a ON a.address_id = c.address_id
JOIN dbo.city AS ci ON ci.city_id = a.city_id
JOIN dbo.country AS co ON co.country_id = ci.country_id;
GO
```

## Answer 2 — Answer

```sql
CREATE OR ALTER VIEW course_lab.v_customer_rentals
AS
SELECT
    r.rental_id,
    r.rental_date,
    r.return_date,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    f.film_id,
    f.title
FROM dbo.rental AS r
JOIN dbo.customer AS c ON c.customer_id = r.customer_id
JOIN dbo.inventory AS i ON i.inventory_id = r.inventory_id
JOIN dbo.film AS f ON f.film_id = i.film_id;
GO
```

## Answer 3 — Answer

```sql
SELECT TOP (10) *
FROM course_lab.v_customer_rentals
ORDER BY rental_date DESC, rental_id DESC;
```


