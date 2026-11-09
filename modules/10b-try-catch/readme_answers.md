# Module 10b — TRY...CATCH — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
BEGIN TRY
    INSERT INTO course_lab.employee (EmployeeID, FirstName, LastName, Salary)
    VALUES (1, 'John', 'Doe', 50000);
END TRY
BEGIN CATCH
    PRINT 'Error! Cannot add an employee with the same ID.';
    PRINT CONCAT('SQL Server error number: ', ERROR_NUMBER());
END CATCH;
```

A primary-key duplicate raises error 2627.

## Answer 2 — Answer

```sql
DECLARE @employee_id int = 6;

BEGIN TRY
    DELETE FROM course_lab.employee
    WHERE EmployeeID = @employee_id;

    IF @@ROWCOUNT > 0
        PRINT 'Employee deletion completed.';
    ELSE
        THROW 50000, 'Error! Cannot delete a non-existent employee.', 1;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
```

`@@ROWCOUNT` must be read immediately after the `DELETE`; any other statement resets it.

## Answer 3 — Answer

```sql
BEGIN TRY
    INSERT INTO course_lab.employee (EmployeeID, FirstName, LastName, Salary)
    VALUES (1, 'John', 'Doe', 50000);
END TRY
BEGIN CATCH
    IF ERROR_NUMBER() IN (2627, 2601)
        PRINT 'Error! Cannot add an employee with the same ID.';
    ELSE
        THROW;
END CATCH;
```

A bare `THROW;` inside `CATCH` rethrows the original error with its number and line.
