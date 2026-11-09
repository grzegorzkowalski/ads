# Module 06c — Data types, CAST and CONVERT

## Mission

Wrong data types waste space and break queries. Inspect existing types and convert values explicitly.

## Exercise 1 — Inspect column types

List the column names, data types, maximum lengths, and nullability of the `customer` table.

## Exercise 2 — Propose type changes

For `customer_id`, `email`, `active`, and `create_date`, propose a better type if one is justified and explain the trade-off. Do not alter the table.

## Exercise 3 — `CAST`

Return `CAST('123' AS int)`, `CAST('3.14' AS float)`, `CAST(42 AS decimal(5, 2))`, and `CAST('2023-01-25' AS datetime)`.

## Exercise 4 — `CONVERT` with styles

Return the registration date of each customer in styles 103, 4, and 104. What is the difference between them?

## Exercise 5 — Safe conversion

Convert the text values `'10'`, `'abc'`, and `'2026-02-30'` to `int` and `date` so that invalid values give `NULL` instead of an error.

---

Instructor reference answers are stored separately in `readme_answers.md`.
