# Module 06 — Make data usable

## Mission

Dates, text, and legacy data types cause many production bugs. The SQL Server Sakila image contains a few columns whose values should be converted explicitly.

## Exercise 1 — Registration date parts

Return customer ID, name, registration date, year, month, and day.

## Exercise 2 — Build a display name

Return a display name in the format `LAST_NAME, FirstName`, without producing `NULL` when a value is missing.

## Exercise 3 — Search film descriptions

Return films whose description contains the word `robot` or whose title starts with `A`.

## Exercise 4 — Convert the legacy release year safely

Show the raw release year and its integer representation. Use `TRY_CONVERT` so one malformed value cannot abort the report.

---

Instructor reference answers are stored separately in `readme_answers.md`.

