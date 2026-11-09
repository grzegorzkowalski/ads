# Module 11a — Stored procedures

## Mission

Package reusable operations as stored procedures with parameters.

## Exercise 1 — Films by category

Create `course_lab.usp_get_films_by_category` with the parameter `@category_name`. It returns the titles of all films in that category. Call it for `Comedy`.

## Exercise 2 — Add an actor

Create `course_lab.usp_add_actor` with `@first_name` and `@last_name`. It inserts a new actor with the current time in `last_update` and prints a confirmation. Bonus: do nothing and print a message if the actor already exists.

## Exercise 3 — Verify and clean up

Call `usp_add_actor` twice with the same name, check the result, and remove the test actor.

---

Instructor reference answers are stored separately in `readme_answers.md`.
