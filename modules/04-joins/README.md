# Module 04 — Connect the business model

## Mission

Sakila stores customers, rentals, inventory, films, categories, actors, and payments in separate tables. Your job is to combine them without multiplying or losing rows accidentally.

## Exercise 1 — Payments and rentals

Join `payment` to `rental` and return payment ID, rental ID, amount, rental date, and payment date.

## Exercise 2 — Every category, including empty categories

Return every category and its film count. A category with no films must still appear.

## Exercise 3 — Customers and their latest rental

Return every customer and the date of their latest rental. Customers without rentals must remain in the result.

## Exercise 4 — Controlled outer join

Run `sql/01_create_course_lab.sql` first. Use `course_lab.join_left` and `course_lab.join_right` to demonstrate why a `FULL OUTER JOIN` can return unmatched rows from both sides.

## Exercise 5 — Controlled right join

Using the same lab tables, return every row from `course_lab.join_right`, including the row that has no matching left row.

## Exercise 6 — Film, category, and actors

Return each film title, category, and a comma-separated actor list. Use `STRING_AGG` and group by the film and category columns.

---

Instructor reference answers are stored separately in `readme_answers.md`.

