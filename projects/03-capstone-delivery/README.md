# Project 3 — Final Capstone Delivery

## Scenario

Sakila Video wants a small customer-loyalty and late-fee platform. You are responsible for the data model, business rules, security, performance, and delivery package.

## Required deliverables

Create a separate folder containing:

```text
README.md
01_schema.sql
02_seed.sql
03_views.sql
04_procedures.sql
05_functions.sql
06_indexes.sql
07_tests.sql
08_reset.sql
architecture.png or architecture.md
```

All new objects must be created in `course_lab` and must not change the reference Sakila tables.

## Functional requirements

### Loyalty

- Define at least three loyalty tiers.
- Store one current tier per customer.
- Store points and enrollment date.
- Calculate lifetime spend from `payment`.
- Create a view showing customer, tier, points, and lifetime spend.

### Late fees

- Identify rentals returned after the film's rental duration.
- Calculate a fee using a documented daily rate.
- Support open rentals without returning dates.
- Expose the calculation through a function.

### Operations

- Create a procedure that recalculates customer tiers inside a transaction.
- Validate inputs and rethrow errors.
- Make repeated execution safe.

### Engineering quality

- Add primary keys, foreign keys, `CHECK`, `UNIQUE`, and `DEFAULT` constraints.
- Add indexes based on actual queries.
- Include at least five assertions in the test script.
- Define a reporting role with least privilege.
- Include reset instructions.

## Acceptance tests

```sql
SELECT COUNT(*) AS tier_count FROM course_lab.loyalty_tier;
SELECT COUNT(*) AS enrolled_customer_count FROM course_lab.customer_loyalty;
SELECT * FROM course_lab.v_customer_loyalty_summary;

IF EXISTS
(
    SELECT 1
    FROM course_lab.customer_loyalty
    WHERE points < 0
)
    THROW 51200, 'Points cannot be negative.', 1;
```

## Reference implementation

This is a compact reference implementation. Extend it with your own documented business decisions.

## Presentation

Present the result in 8–10 minutes:

1. business problem and assumptions;
2. relational model;
3. most important query or procedure;
4. transaction and error path;
5. security decision;
6. performance evidence;
7. limitations and next steps.

---

Instructor reference answers are stored separately in `readme_answers.md`.

