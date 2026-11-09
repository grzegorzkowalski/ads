# Module 06a — Date functions

## Mission

Rental operations depend on dates: when a customer registered, how long a film was kept, and when it is due. Practise `DATEPART`, `DATEADD`, `DATEDIFF`, and `GETDATE`.

## Exercise 1 — Split the registration date

From `customer` return `customer_id`, `create_date`, and the year, month, and day as separate columns.

## Exercise 2 — Average film length in seconds

Return the average film length in seconds, rounded to two decimal places. Avoid integer division.

## Exercise 3 — Days a film was kept

For returned rentals return the rental ID, both dates, the number of days kept (`DATEDIFF`), and the date 7 days after the rental date (`DATEADD`). Show the 20 longest rentals.

## Exercise 4 — Current date and time

Return the current date and time with `GETDATE()`, and compare it with `SYSDATETIME()` and `GETUTCDATE()`. Which one has the highest precision?

## Exercise 5 — Rentals from a given month

Return the number of rentals per month for the year of the earliest rental, sorted by month.

---

Instructor reference answers are stored separately in `readme_answers.md`.
