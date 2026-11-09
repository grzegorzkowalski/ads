# Module 08b — Alter tables

## Mission

Change an existing table with `ALTER TABLE` and `sp_rename`. All changes use copies in `course_lab`, so Sakila keeps its original structure.

## Setup

```sql
IF OBJECT_ID('course_lab.customer_copy', 'U') IS NOT NULL DROP TABLE course_lab.customer_copy;
IF OBJECT_ID('course_lab.rental_copy', 'U') IS NOT NULL DROP TABLE course_lab.rental_copy;
IF OBJECT_ID('course_lab.actor_copy', 'U') IS NOT NULL DROP TABLE course_lab.actor_copy;
IF OBJECT_ID('course_lab.address_copy', 'U') IS NOT NULL DROP TABLE course_lab.address_copy;

SELECT * INTO course_lab.customer_copy FROM customer;
SELECT * INTO course_lab.rental_copy FROM rental;
SELECT * INTO course_lab.actor_copy FROM actor;
SELECT * INTO course_lab.address_copy FROM address;

ALTER TABLE course_lab.customer_copy ADD CONSTRAINT PK_customer_copy PRIMARY KEY (customer_id);
```

## Exercise 1 — Add and drop a foreign key

Add the foreign key `FK_rental_copy_customer_copy` from `course_lab.rental_copy.customer_id` to `course_lab.customer_copy.customer_id`. Then write the statement that removes it.

## Exercise 2 — Add a unique column

Add `second_email varchar(100)` with a `UNIQUE` constraint to `course_lab.customer_copy`. Why does a plain `UNIQUE` column behave unexpectedly with several `NULL` values in SQL Server?

## Exercise 3 — Rename a table

Rename `course_lab.actor_copy` to `performer_copy`, verify it on the server, and rename it back.

## Exercise 4 — Add a column filled from another table

Add `city varchar(50)` to `course_lab.address_copy` and fill it with the city name from `city`. Then drop the column again. What length is enough?

---

Instructor reference answers are stored separately in `readme_answers.md`.
