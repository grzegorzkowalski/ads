# Module 14 — Reason about concurrent work

## Mission

Two employees can change the same inventory at the same time. Transactions must protect business rules, not only group statements together.

## Exercise 1 — Inspect the current isolation level

Return the current transaction isolation level for the session.

## Exercise 2 — Reserve one inventory item safely

Select one available inventory row for `ACADEMY DINOSAUR` while protecting the selection from another transaction. Roll back while testing.

## Exercise 3 — Compare locking choices

Explain the difference between `UPDLOCK`, `HOLDLOCK`, and `READPAST`.

## Exercise 4 — Concurrency reflection

Why can a transaction be logically correct but still cause blocking or deadlocks?

---

Instructor reference answers are stored separately in `readme_answers.md`.

