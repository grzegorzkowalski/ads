# Module 11a — Stored procedures — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE OR ALTER PROCEDURE course_lab.usp_get_films_by_category
    @category_name varchar(25)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT f.title
    FROM dbo.film AS f
    JOIN dbo.film_category AS fc ON fc.film_id = f.film_id
    JOIN dbo.category AS c ON c.category_id = fc.category_id
    WHERE c.name = @category_name
    ORDER BY f.title;
END;
GO

EXEC course_lab.usp_get_films_by_category @category_name = 'Comedy';
```

## Answer 2 — Answer

```sql
CREATE OR ALTER PROCEDURE course_lab.usp_add_actor
    @first_name varchar(45),
    @last_name varchar(45)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM dbo.actor WHERE first_name = @first_name AND last_name = @last_name)
    BEGIN
        PRINT 'Actor already exists.';
        RETURN;
    END;

    INSERT INTO dbo.actor (first_name, last_name, last_update)
    VALUES (@first_name, @last_name, GETDATE());

    PRINT 'Actor has been successfully added.';
END;
GO
```

## Answer 3 — Answer

```sql
EXEC course_lab.usp_add_actor @first_name = 'TEST', @last_name = 'PROCEDURE';
EXEC course_lab.usp_add_actor @first_name = 'TEST', @last_name = 'PROCEDURE';   -- already exists

SELECT actor_id, first_name, last_name FROM actor WHERE last_name = 'PROCEDURE';

DELETE FROM actor WHERE first_name = 'TEST' AND last_name = 'PROCEDURE';
```

`SET NOCOUNT ON` suppresses the "rows affected" messages that clients otherwise receive for every statement.
