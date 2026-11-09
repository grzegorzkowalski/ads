# Module 10a — Transactions — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DECLARE @dry_run bit = 1;
DECLARE @film_id int = (SELECT TOP (1) film_id FROM film WHERE title = 'ACADEMY DINOSAUR' ORDER BY film_id);
DECLARE @comedy_id tinyint = (SELECT category_id FROM category WHERE name = 'Comedy');

BEGIN TRANSACTION;

IF @film_id IS NOT NULL
BEGIN
    UPDATE film_category
    SET category_id = @comedy_id
    WHERE film_id = @film_id;

    SELECT film_id, category_id FROM film_category WHERE film_id = @film_id;

    IF @dry_run = 1 ROLLBACK TRANSACTION; ELSE COMMIT TRANSACTION;
END
ELSE
    ROLLBACK TRANSACTION;
```

## Answer 2 — Answer

```sql
DECLARE @dry_run bit = 1;
SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @film_id int = (SELECT TOP (1) film_id FROM film WHERE title = 'ACADEMY DINOSAUR' ORDER BY film_id);
    DECLARE @inventory_id int = (SELECT TOP (1) inventory_id FROM inventory WHERE film_id = @film_id ORDER BY inventory_id);
    DECLARE @address_id int = (SELECT TOP (1) address_id FROM address ORDER BY address_id);
    DECLARE @customer_id int;

    INSERT INTO customer (store_id, first_name, last_name, address_id, active)
    VALUES (1, 'JAN', 'KOWALSKI', @address_id, 1);

    SET @customer_id = SCOPE_IDENTITY();

    INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
    VALUES (GETDATE(), @inventory_id, @customer_id, 1);

    IF @dry_run = 1 ROLLBACK TRANSACTION; ELSE COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
```

Use `SCOPE_IDENTITY()` to read the new customer ID. `XACT_ABORT ON` rolls back automatically on most runtime errors.

## Answer 3 — Answer

```sql
DECLARE @dry_run bit = 1;
DECLARE @film_id int = (SELECT TOP (1) film_id FROM film WHERE title = 'ACADEMY DINOSAUR' ORDER BY film_id);

BEGIN TRANSACTION;

IF (SELECT COUNT(*) FROM inventory WHERE film_id = @film_id) > 1
BEGIN
    DELETE FROM inventory
    WHERE inventory_id = (SELECT TOP (1) inventory_id FROM inventory WHERE film_id = @film_id ORDER BY inventory_id DESC);

    IF @dry_run = 1 ROLLBACK TRANSACTION; ELSE COMMIT TRANSACTION;
END
ELSE
    ROLLBACK TRANSACTION;
```

`DELETE TOP (1)` without `ORDER BY` picks an arbitrary row. The delete fails with a foreign-key error if the chosen copy has rentals; pick a copy with no rentals to succeed.
