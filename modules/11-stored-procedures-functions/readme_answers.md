# Module 11 — Publish database operations — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE OR ALTER PROCEDURE course_lab.usp_films_by_category
    @category_name varchar(25)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        f.film_id,
        f.title,
        f.release_year,
        f.length,
        f.rental_rate
    FROM film AS f
    JOIN film_category AS fc ON fc.film_id = f.film_id
    JOIN category AS c ON c.category_id = fc.category_id
    WHERE c.name = @category_name
    ORDER BY f.title;
END;
GO

EXEC course_lab.usp_films_by_category @category_name = 'Comedy';
```

## Answer 2 — Answer

```sql
CREATE OR ALTER PROCEDURE course_lab.usp_add_actor
    @first_name varchar(45),
    @last_name varchar(45)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT 1
        FROM actor
        WHERE first_name = @first_name
          AND last_name = @last_name
    )
        THROW 51010, 'This actor already exists.', 1;

    INSERT INTO actor (first_name, last_name, last_update)
    OUTPUT inserted.actor_id, inserted.first_name, inserted.last_name
    VALUES (@first_name, @last_name, GETDATE());
END;
GO
```

## Answer 3 — Answer

```sql
CREATE OR ALTER FUNCTION course_lab.ufn_customer_rental_count
(
    @customer_id int
)
RETURNS int
AS
BEGIN
    DECLARE @result int;

    SELECT @result = COUNT(*)
    FROM rental
    WHERE customer_id = @customer_id;

    RETURN COALESCE(@result, 0);
END;
GO

SELECT
    customer_id,
    course_lab.ufn_customer_rental_count(customer_id) AS rental_count
FROM customer;
```


