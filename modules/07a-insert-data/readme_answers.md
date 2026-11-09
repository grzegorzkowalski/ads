# Module 07a — Insert data — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DECLARE @english_language_id tinyint =
(
    SELECT TOP (1) language_id
    FROM language
    WHERE name = 'English'
    ORDER BY language_id
);

INSERT INTO film
(
    title, description, release_year, language_id,
    rental_duration, rental_rate, length, replacement_cost, rating
)
OUTPUT inserted.film_id, inserted.title
VALUES
('Extended Adventure', 'A course-created test film.', '2026', @english_language_id,
 5, 4.99, 150, 19.99, 'PG');
```

`film_id` is an `IDENTITY` column: SQL Server generates it, so do not insert it. `OUTPUT inserted.film_id` (or `SCOPE_IDENTITY()`) returns the value. To remove the row later, use the narrow `DELETE` from `07c-delete-data`.

## Answer 2 — Answer

```sql
IF OBJECT_ID('course_lab.client', 'U') IS NOT NULL
    DROP TABLE course_lab.client;

CREATE TABLE course_lab.client
(
    id int,
    first_name varchar(50),
    last_name varchar(50)
);

INSERT INTO course_lab.client (id, first_name, last_name)
VALUES
    (1, 'Jan', 'Kowalski'),
    (2, 'Anna', 'Nowak'),
    (3, 'Piotr', 'Ziemowit');

SELECT id, first_name, last_name FROM course_lab.client ORDER BY id;

INSERT INTO course_lab.client (id, first_name, last_name)
VALUES (4, 'Karolina', 'Nowicka');
```

A multi-row `VALUES` list is one statement: it succeeds or fails as a whole.

## Answer 3 — Answer

```sql
IF OBJECT_ID('course_lab.student', 'U') IS NOT NULL
    DROP TABLE course_lab.student;

CREATE TABLE course_lab.student
(
    student_id int IDENTITY(1, 1) CONSTRAINT PK_student PRIMARY KEY,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    email varchar(50) NULL
);

INSERT INTO course_lab.student (first_name, last_name, email)
SELECT TOP (5) first_name, last_name, email
FROM customer
ORDER BY customer_id;

SELECT * FROM course_lab.student;
```

`TOP` without `ORDER BY` returns arbitrary rows.

## Answer 4 — Answer

```sql
INSERT INTO course_lab.client
VALUES (5, 'Ewa', 'Zielinska');
```

Values go to columns in table-definition order. If someone adds or reorders columns later, this statement fails or writes data into the wrong column. Always list columns explicitly.
