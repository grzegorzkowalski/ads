# Module 07b — Update data

## Mission

`UPDATE` without `WHERE` changes every row. Practise targeted updates, and always preview and use a transaction you can roll back.

## Exercise 1 — Update one actor

Show actor ID 15, set the first name to `Robert`, show the row again, and roll back.

## Exercise 2 — Shift return dates

In a transaction, set `return_date` of rentals 1–10 to 7 days after their `rental_date`, show the result, and roll back.

## Exercise 3 — Update an address

Update the address text of the address belonging to customer ID 10 to `Nowa Ulica 123`. Find the address through the customer; do not guess the address ID. Roll back.

## Exercise 4 — Why `WHERE` matters

Without running it, explain what `UPDATE customer SET active = 0;` would do. Then show how to count the rows a statement will touch before running it.

---

Instructor reference answers are stored separately in `readme_answers.md`.
