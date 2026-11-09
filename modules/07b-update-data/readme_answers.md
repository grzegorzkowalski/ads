# Module 07b — Update data — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
BEGIN TRANSACTION;

SELECT actor_id, first_name, last_name FROM actor WHERE actor_id = 15;

UPDATE actor
SET first_name = 'Robert'
WHERE actor_id = 15;

SELECT actor_id, first_name, last_name FROM actor WHERE actor_id = 15;

ROLLBACK TRANSACTION;
```

## Answer 2 — Answer

```sql
BEGIN TRANSACTION;

UPDATE rental
SET return_date = DATEADD(DAY, 7, rental_date)
WHERE rental_id BETWEEN 1 AND 10;

SELECT rental_id, rental_date, return_date
FROM rental
WHERE rental_id BETWEEN 1 AND 10
ORDER BY rental_id;

ROLLBACK TRANSACTION;
```

T-SQL has no `INTERVAL`; use `DATEADD`.

## Answer 3 — Answer

```sql
BEGIN TRANSACTION;

UPDATE a
SET a.address = 'Nowa Ulica 123'
FROM address AS a
JOIN customer AS c ON c.address_id = a.address_id
WHERE c.customer_id = 10;

SELECT c.customer_id, a.address_id, a.address
FROM customer AS c
JOIN address AS a ON a.address_id = c.address_id
WHERE c.customer_id = 10;

ROLLBACK TRANSACTION;
```

The address lives in `address`, not in `customer`. Other customers could share an address row, so check the count before committing.

## Answer 4 — Answer

`UPDATE customer SET active = 0;` marks every customer inactive. Preview the affected rows first:

```sql
SELECT COUNT(*) AS rows_to_change
FROM customer
WHERE customer_id = 6;
```

Then run the `UPDATE` with the same `WHERE` and compare the reported row count.
