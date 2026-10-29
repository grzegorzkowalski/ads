# Module 08 — Design reliable tables

## Mission

Sakila is already modelled, but new features need new tables. Create structures that prevent invalid and duplicated data.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Create a customer note table

Create `course_lab.customer_note` with an identity key, a foreign key to `customer`, a required note, and a creation timestamp.

## Exercise 2 — Model a many-to-many relationship

Create a `course_lab.film_tag` table and a `course_lab.film_tag_map` table. The map table must have a composite primary key.

## Exercise 3 — Inspect metadata

List columns and data types for the `customer` table.

---

Instructor reference answers are stored separately in `readme_answers.md`.

