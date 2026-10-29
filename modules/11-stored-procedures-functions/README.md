# Module 11 — Publish database operations

## Mission

Move repeatable operations into named database objects with parameters, validation, and predictable results.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Films by category

Create `course_lab.usp_films_by_category`, accepting a category name and returning matching films.

## Exercise 2 — Add an actor idempotently

Create a procedure that inserts an actor only if the same first and last name does not already exist.

## Exercise 3 — Count rentals for a customer

Create a scalar function that returns the number of rentals for a customer.

## Reflection

When is a procedure a better interface than a view? Consider parameters, validation, side effects, and permissions.

---

Instructor reference answers are stored separately in `readme_answers.md`.

