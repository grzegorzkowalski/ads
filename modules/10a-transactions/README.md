# Module 10a — Transactions

## Mission

A transaction groups several statements so they succeed or fail together. Each answer has a `@dry_run` switch: with `1` it rolls back, so the Sakila data stays unchanged.

## Exercise 1 — Move a film only if it exists

Move `ACADEMY DINOSAUR` to the `Comedy` category in a transaction, but only if the film exists. Otherwise roll back.

## Exercise 2 — New customer and rental

In one transaction add the customer JAN KOWALSKI and a rental of `ACADEMY DINOSAUR` for that customer. Commit only if both steps succeed.

## Exercise 3 — Remove one copy only if more than one exists

For `ACADEMY DINOSAUR` delete one copy from `inventory`, but only if more than one copy exists. Otherwise roll back. Explain why this may fail in Sakila.

---

Instructor reference answers are stored separately in `readme_answers.md`.
