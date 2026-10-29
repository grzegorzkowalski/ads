# Module 13 — Protect the database

## Mission

A database is also a security boundary. Give users only the permissions required for their work and expose business operations through controlled interfaces.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Inspect your effective permissions

List the permissions available to the current database user.

## Exercise 2 — Create a reporting role

Create a role that can read the course schema but cannot execute stored procedures by default.

## Exercise 3 — Grant procedure execution explicitly

Allow the reporting role to execute the category procedure without granting broad write permissions.

## Exercise 4 — Explain least privilege

Explain why a report user should not receive `db_owner`, even if the user needs to read every report.

---

Instructor reference answers are stored separately in `readme_answers.md`.

