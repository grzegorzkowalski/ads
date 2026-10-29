# Module 16 — Test, package, and deliver database changes

## Mission

A database change is not finished when it works once in a query window. It needs a repeatable script, tests, documentation, and a rollback or reset strategy.

## Exercise 1 — Write an assertion

Fail the batch if the Sakila database contains fewer than 16 tables.

## Exercise 2 — Test a view contract

Fail the batch if the customer directory view returns no customers.

## Exercise 3 — Make a migration repeatable

Write a migration that creates a table only when it does not already exist.

## Exercise 4 — Delivery checklist

Prepare a release package containing:

- a README with assumptions and setup steps;
- schema and seed scripts;
- migration scripts;
- verification tests;
- a rollback or disposable reset strategy;
- execution-plan evidence for the important query;
- a diagram of the relational model;
- a short explanation of security choices.

---

Instructor reference answers are stored separately in `readme_answers.md`.

