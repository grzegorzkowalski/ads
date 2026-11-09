# Module 08g — Database design

## Mission

Design a hybrid solution for bank-branch visit counting: a document store for raw sensor events and a relational database for reports.

## Scenario

Every branch has IoT sensors that record people entering and leaving. Events may also carry the hour, weekday, visit type (cash desk, credit office), and environmental values such as temperature or noise.

## Exercise 1 — Raw events in MongoDB

Design a MongoDB collection for sensor events: branch ID, sensor ID, timestamp, number of people, direction, and visit type. Write one sample document and decide which indexes you need.

## Exercise 2 — Reporting database in SQL Server

Design tables for branches (location, opening hours), sensors, daily visit counts (per visit type), and weekly or monthly summaries. Choose data types, keys, constraints, and indexes, and keep the model normalized.

## Exercise 3 — Diagrams

Draw the MongoDB schema and the SQL ERD in `draw.io`, `erd-editor.io`, or `hackolade`.

## Exercise 4 — Business questions

Write two queries the report model must answer: (1) visits by hour of day for a branch, (2) the effect of a marketing campaign date on weekly visits.

---

Instructor reference answers are stored separately in `readme_answers.md`.
