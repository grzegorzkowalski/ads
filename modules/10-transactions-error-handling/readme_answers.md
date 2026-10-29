# Module 10 — Protect business operations — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SET XACT_ABORT ON;
BEGIN TRANSACTION;

DECLARE @film_id int =
(
    SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR'
);

DECLARE @category_id tinyint =
(
    SELECT category_id FROM category WHERE name = 'Comedy'
);

IF @film_id IS NULL OR @category_id IS NULL
    THROW 51000, 'Film or category was not found.', 1;

UPDATE film_category
SET category_id = @category_id
WHERE film_id = @film_id;

ROLLBACK TRANSACTION;
```

## Answer 2 — Answer

```sql
SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @customer_id int;
    DECLARE @inventory_id int =
    (
        SELECT TOP (1) i.inventory_id
        FROM inventory AS i
        JOIN film AS f ON f.film_id = i.film_id
        WHERE f.title = 'ACADEMY DINOSAUR'
        ORDER BY i.inventory_id
    );

    IF @inventory_id IS NULL
        THROW 51001, 'No inventory is available for the selected film.', 1;

    INSERT INTO customer
    (
        store_id, first_name, last_name, address_id, active, create_date
    )
    VALUES
    (
        1, 'COURSE', 'CUSTOMER', 1, 1, GETDATE()
    );

    SET @customer_id = CONVERT(int, SCOPE_IDENTITY());

    INSERT INTO rental
    (
        rental_date, inventory_id, customer_id, staff_id
    )
    VALUES
    (
        GETDATE(), @inventory_id, @customer_id, 1
    );

    ROLLBACK TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;
```

## Answer 3 — Answer

```sql
IF OBJECT_ID('course_lab.employee_demo', 'U') IS NOT NULL
    DROP TABLE course_lab.employee_demo;
GO

CREATE TABLE course_lab.employee_demo
(
    employee_id int CONSTRAINT PK_employee_demo PRIMARY KEY,
    employee_name nvarchar(100) NOT NULL
);
GO

INSERT INTO course_lab.employee_demo VALUES (1, N'Alex');

BEGIN TRY
    INSERT INTO course_lab.employee_demo VALUES (1, N'Robin');
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS error_number,
        'Error: an employee with this ID already exists.' AS friendly_message;
END CATCH;
```


