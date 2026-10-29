# Module 09 — Build reusable reporting views

## Mission

A view is a named query contract. Create views that hide joins while exposing only useful business columns.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Customer directory

Create `course_lab.v_customer_directory` with customer ID, full name, email, city, and country.

## Exercise 2 — Customer rentals

Create `course_lab.v_customer_rentals` with rental ID, dates, customer name, and film title.

## Exercise 3 — Test the view contract

Return the ten most recent rentals using the view, without repeating its joins.

## Reflection

What should happen to consumers of a view if a base table gains an unrelated column? This is one reason to avoid `SELECT *` inside view definitions.

---

Instructor reference answers are stored separately in `readme_answers.md`.

