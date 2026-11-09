# Module 03b — Grouping functions

## Mission

Management wants reports built on `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, and `GROUP BY`. Some results must be kept in the database. Complete Module 03 first.

## Exercise 1 — Customer payment report

For every customer return first name, last name, email, number of payments, total amount, average payment, and date of the last payment. Save the query as the view `course_lab.v_customer_payment_report`.

## Exercise 2 — Actors per film

Return film ID, title, and number of actors. Save the result in the temporary table `#tmp_film_actors`. Keep films without actors.

## Exercise 3 — Rentals per film

Return film ID, title, and the number of times the film was rented. Save the result in `#tmp_film_rentals`.

## Exercise 4 — Average film length by category

Return the average film length for each category, longest first. Do not let integer division truncate the average.

---

Instructor reference answers are stored separately in `readme_answers.md`.
