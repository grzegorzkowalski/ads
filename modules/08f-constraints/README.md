# Module 08f — Constraints

## Mission

Constraints (`NOT NULL`, `CHECK`, `UNIQUE`, `DEFAULT`) reject bad data before it is stored.

## Exercise 1 — `NOT NULL`

Create `course_lab.customer_not_null` (`customer_id int` primary key, `customer_name varchar(50) NOT NULL`). Insert a valid row and a row with `NULL` name.

## Exercise 2 — `CHECK`

Create `course_lab.payment_check` (`payment_id int` primary key, `amount decimal(5, 2)`, `payment_date date`) with a check that `amount > 0`. Insert a valid and an invalid row.

## Exercise 3 — `UNIQUE` and `DEFAULT`

Add a unique `email` column and a `created_at` column that defaults to the current UTC time to `course_lab.customer_not_null`. Insert two rows with the same email.

---

Instructor reference answers are stored separately in `readme_answers.md`.
