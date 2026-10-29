# Project 1 — Sakila Business Investigation

## Scenario

Sakila Video is preparing a management meeting. You must produce a short SQL investigation covering customer value, inventory usage, and data quality.

## Deliverables

Create `report.sql` containing four queries and a short `REPORT.md` explaining the findings.

### Task 1 — Highest-value customers

Return the top ten customers by total payment amount. Include customer ID, full name, payment count, and total revenue.

### Task 2 — Films with the highest demand

Return the top ten films by rental count. Include films that have never been rented if they belong in the report.

### Task 3 — Films with no rentals

Find films for which no inventory item has ever appeared in a rental.

### Task 4 — Revenue by category

Return total payment revenue by category. Explain why a film can contribute to more than one category in the Sakila model.

### Task 5 — Data quality check

Check for payments whose customer does not exist. The expected result in a valid Sakila database is zero rows. Do not insert fake orphan records into the reference schema.

## Evaluation

- Correctness: 40%
- Joins and model understanding: 20%
- Readability and naming: 15%
- Data-quality reasoning: 15%
- Written findings: 10%

---

Instructor reference answers are stored separately in `readme_answers.md`.

