# Module 03a — Filter groups with HAVING

## Mission

`WHERE` filters rows before grouping; `HAVING` filters groups after aggregation. Practise choosing the right one. Complete Module 03 first.

## Exercise 1 — Moderately active customers

Return customers who rented more than 10 but fewer than 20 films. Show the customer ID and rental count, sorted from the lowest to the highest rental count. Which table holds the rentals?

## Exercise 2 — Customers with at least 5 rentals

Count rentals per customer, but return only customers with at least 5 rentals.

## Exercise 3 — High payment activity

Return customer ID, number of payments, and total paid for customers with at least 30 payments **and** a total above 200. Sort by total, highest first.

## Exercise 4 — Actors with large filmographies

Return actor ID and film count for actors who appear in at least 35 films, most films first.

## Exercise 5 — `WHERE` versus `HAVING`

Assume a payment of `1` or less is a late-fee adjustment, not a rental price. Return customers whose payments **above 1** add up to more than 50. Explain which condition belongs in `WHERE` and which in `HAVING`.

## Reflection

Why can `HAVING SUM(amount) > 50` not be written in `WHERE`?

---

Instructor reference answers are stored separately in `readme_answers.md`.
