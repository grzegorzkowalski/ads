# Module 15 — Use JSON in SQL Server

## Mission

Some customer preferences are flexible and change more often than the relational model. SQL Server can store and query valid JSON while keeping core business relationships relational.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Read JSON properties

Extract preferred language and email notification settings from a JSON document.

## Exercise 2 — Expand a JSON array

Return one row for each preferred genre.

## Exercise 3 — Store validated preferences

Create a table that accepts only valid JSON.

## Exercise 4 — Return relational data as JSON

Return the five most expensive films as a JSON array for an API consumer.

## Design rule

Keep keys, relationships, amounts, dates, and constraints relational. Use JSON for flexible attributes that do not need frequent joins, foreign keys, or independent reporting.

---

Instructor reference answers are stored separately in `readme_answers.md`.

