# Module 09a — Create views

## Mission

A view is a stored query. Create simple views, a view with joins, and a view with aggregation, then change and drop them.

## Exercise 1 — Customers

Create `course_lab.v_clients` with `customer_id`, `first_name`, and `last_name` from `customer`, then select from it.

## Exercise 2 — Customer rentals

Create `course_lab.v_client_rentals` with `rental_id`, `rental_date`, `return_date`, `first_name`, and `last_name`.

## Exercise 3 — Films and categories

Create `course_lab.v_films_categories` with `film_id`, `title`, `category_name`, and `release_year`.

## Exercise 4 — Change and drop

Add `email` to `course_lab.v_clients`, then drop the view. Which T-SQL forms can change a view?

## Exercise 5 — View or table?

Create `course_lab.v_long_films` for films longer than 120 minutes, and a table `course_lab.long_film_table` from the same query. Change the length of one film inside a transaction and compare both, then roll back. What did you learn?

---

Instructor reference answers are stored separately in `readme_answers.md`.
