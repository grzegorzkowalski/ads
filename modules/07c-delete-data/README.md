# Module 07c — Delete data

## Mission

`DELETE` removes selected rows, `TRUNCATE` removes all rows quickly and resets identity. Practise both on a disposable table.

## Setup

```sql
IF OBJECT_ID('course_lab.example_table', 'U') IS NOT NULL
    DROP TABLE course_lab.example_table;

CREATE TABLE course_lab.example_table
(
    customer_id int IDENTITY(1, 1) CONSTRAINT PK_example_table PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100)
);

INSERT INTO course_lab.example_table (first_name, last_name, email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Bob', 'Johnson', 'bob.johnson@example.com'),
    ('Alice', 'Johnson', 'alice.johnson@example.com'),
    ('Charlie', 'Brown', 'charlie.brown@example.com'),
    ('Eva', 'Miller', 'eva.miller@example.com'),
    ('Daniel', 'Williams', 'daniel.williams@example.com');
```

## Exercise 1 — Delete one record

Delete the row with `customer_id = 2`.

## Exercise 2 — Delete many records

Delete everyone with the last name `Johnson`. Then insert Grace Anderson, Frank White, and Olivia Turner and observe the new IDs.

## Exercise 3 — `TRUNCATE`

Remove all rows with `TRUNCATE`, insert Liam Smith, Ava Johnson, and Lucas Williams, and observe the IDs again.

## Exercise 4 — Compare

Complete the table: which command accepts `WHERE`, which resets identity, which is minimally logged, and which is blocked by a foreign key?

## Exercise 5 — Delete a course-created film

Delete the `Extended Adventure` film created in `07a-insert-data` only if it was created by that exercise. Why can deleting other Sakila films fail?

---

Instructor reference answers are stored separately in `readme_answers.md`.
