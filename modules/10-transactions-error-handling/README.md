# Module 10 — Protect business operations

## Mission

A rental operation may change several tables. The database must either complete the whole operation or leave the data unchanged.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Move a film category safely

Move `ACADEMY DINOSAUR` to the `Comedy` category only if both the film and category exist. Use a transaction and roll it back while testing.

## Exercise 2 — Add a customer and rental atomically

Create a new customer and a rental in one transaction. If any statement fails, roll back and rethrow the error.

## Exercise 3 — Handle a duplicate key

Create a small table and show a friendly error when an employee ID is inserted twice.

---

Instructor reference answers are stored separately in `readme_answers.md`.

