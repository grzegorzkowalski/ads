# Module 04 — Connect the business model — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    p.payment_id,
    p.rental_id,
    p.amount,
    r.rental_date,
    p.payment_date
FROM payment AS p
JOIN rental AS r ON r.rental_id = p.rental_id;
```

## Answer 2 — Answer

```sql
SELECT
    c.category_id,
    c.name,
    COUNT(fc.film_id) AS film_count
FROM category AS c
LEFT JOIN film_category AS fc ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY c.category_id;
```

## Answer 3 — Answer

```sql
WITH latest_rental AS
(
    SELECT
        customer_id,
        MAX(rental_date) AS latest_rental_date
    FROM rental
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    lr.latest_rental_date
FROM customer AS c
LEFT JOIN latest_rental AS lr ON lr.customer_id = c.customer_id
ORDER BY lr.latest_rental_date DESC, customer_name;
```

## Answer 4 — Answer

```sql
SELECT
    l.left_id,
    l.label AS left_label,
    r.right_id,
    r.label AS right_label
FROM course_lab.join_left AS l
FULL OUTER JOIN course_lab.join_right AS r
    ON r.left_id = l.left_id
ORDER BY COALESCE(l.left_id, r.left_id);
```

## Answer 5 — Answer

```sql
SELECT
    l.left_id,
    l.label AS left_label,
    r.right_id,
    r.label AS right_label
FROM course_lab.join_left AS l
RIGHT JOIN course_lab.join_right AS r
    ON r.left_id = l.left_id
ORDER BY r.right_id;
```

## Answer 6 — Answer

```sql
SELECT
    f.film_id,
    f.title,
    c.name AS category_name,
    STRING_AGG(CONCAT(a.first_name, ' ', a.last_name), ', ')
        WITHIN GROUP (ORDER BY a.last_name, a.first_name) AS actors
FROM film AS f
JOIN film_category AS fc ON fc.film_id = f.film_id
JOIN category AS c ON c.category_id = fc.category_id
JOIN film_actor AS fa ON fa.film_id = f.film_id
JOIN actor AS a ON a.actor_id = fa.actor_id
GROUP BY f.film_id, f.title, c.name;
```


