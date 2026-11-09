# Module 10b — TRY...CATCH

## Mission

Handle errors with `TRY...CATCH`, `@@ROWCOUNT`, and `THROW`.

## Setup

```sql
DROP TABLE IF EXISTS course_lab.employee;

CREATE TABLE course_lab.employee
(
    EmployeeID int NOT NULL CONSTRAINT PK_employee PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Salary decimal(10, 2)
);

INSERT INTO course_lab.employee (EmployeeID, FirstName, LastName, Salary)
VALUES
    (1, 'John', 'Doe', 50000),
    (2, 'Jane', 'Smith', 60000),
    (3, 'Mike', 'Johnson', 75000),
    (4, 'Anna', 'Davis', 80000),
    (5, 'Mark', 'Taylor', 70000);
```

## Exercise 1 — Duplicate key

Insert John Doe with `EmployeeID = 1` again. Catch the error and print `Error! Cannot add an employee with the same ID.`. Print the SQL Server error number in the same handler.

## Exercise 2 — Delete a missing employee

Delete an employee by ID. If a row was deleted print `Employee deletion completed.`; if not, raise the error `Error! Cannot delete a non-existent employee.` and handle it in `CATCH`.

## Exercise 3 — Rethrow

Change the handler from Exercise 1 so that an unexpected error other than a duplicate key is rethrown.

---

Instructor reference answers are stored separately in `readme_answers.md`.
