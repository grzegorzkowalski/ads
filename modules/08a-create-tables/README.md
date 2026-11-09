# Module 08a — Create tables

## Mission

Create permanent and temporary tables, and build a table straight from a query.

## Exercise 1 — Permanent table

Create `course_lab.clients` with `id int`, `first_name varchar(50)`, and `last_name varchar(50)`, then query it.

## Exercise 2 — Temporary table

Create the temporary table `#tmp_table` (`id int`, `title varchar(100)`, `published_date int`). Prove it exists by querying `tempdb`.

## Exercise 3 — Table from a query

Create `course_lab.long_film` containing films longer than 120 minutes, using `SELECT ... INTO`. Count the rows.

## Exercise 4 — Temporary table from a query

Create `#tmp_actor_nick` with the actors whose first name is `NICK`.

## Exercise 5 — Scope

Open a second query window and select from `#tmp_actor_nick`. What happens, and why?

---

Instructor reference answers are stored separately in `readme_answers.md`.
