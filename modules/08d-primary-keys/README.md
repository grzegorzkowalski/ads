# Module 08d — Primary keys

## Mission

A primary key identifies a row uniquely and can never be `NULL`. Create keys at table creation and add them later.

## Exercise 1 — Key at creation

Create `course_lab.customers` with `CustomerID int` (primary key), `FirstName varchar(50)`, and `LastName varchar(50)`. Name the constraint.

## Exercise 2 — Add an auto-increment key later

Create `course_lab.clients_no_key` (`ClientID int`, `FirstName`, `LastName`, `Email`, `Address`, `City`, `Country`) and add `ClientCode` as an auto-incrementing primary key.

## Exercise 3 — Prove it

Insert two rows with the same `CustomerID` into `course_lab.customers`. What happens?

---

Instructor reference answers are stored separately in `readme_answers.md`.
