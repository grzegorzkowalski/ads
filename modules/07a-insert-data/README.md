# Module 07a — Insert data

## Mission

Add rows with `INSERT INTO ... VALUES` and `INSERT INTO ... SELECT`. Use course-owned tables so Sakila stays clean.

## Exercise 1 — Insert one film

Insert a film titled `Extended Adventure` with a length of 150 minutes. Which value does `film_id` get, and how can you read it?

## Exercise 2 — Several rows in one statement

Create `course_lab.client` (`id int`, `first_name varchar(50)`, `last_name varchar(50)`). In **one** `INSERT` add Jan Kowalski (1), Anna Nowak (2), and Piotr Ziemowit (3). Query the table, then add Karolina Nowicka (4).

## Exercise 3 — Insert from a query

Create `course_lab.student` (`student_id int IDENTITY`, `first_name`, `last_name`, `email`) and fill it with the first five customers using `INSERT ... SELECT TOP`.

## Exercise 4 — Omit the column list

Insert a row into `course_lab.client` without naming the columns. Why is this risky?

---

Instructor reference answers are stored separately in `readme_answers.md`.
