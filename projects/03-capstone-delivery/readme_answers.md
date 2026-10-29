# Project 3 — Final Capstone Delivery — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Expand the reference implementation

```sql
USE sakila;
GO

IF OBJECT_ID('course_lab.customer_loyalty', 'U') IS NOT NULL DROP TABLE course_lab.customer_loyalty;
IF OBJECT_ID('course_lab.loyalty_tier', 'U') IS NOT NULL DROP TABLE course_lab.loyalty_tier;
GO

CREATE TABLE course_lab.loyalty_tier
(
    tier_id int IDENTITY(1, 1) CONSTRAINT PK_loyalty_tier PRIMARY KEY,
    tier_name nvarchar(50) NOT NULL CONSTRAINT UQ_loyalty_tier_name UNIQUE,
    minimum_spend decimal(10, 2) NOT NULL
        CONSTRAINT CK_loyalty_tier_minimum_spend CHECK (minimum_spend >= 0),
    discount_percent decimal(5, 2) NOT NULL
        CONSTRAINT CK_loyalty_tier_discount CHECK (discount_percent BETWEEN 0 AND 100)
);

CREATE TABLE course_lab.customer_loyalty
(
    customer_id int CONSTRAINT PK_customer_loyalty PRIMARY KEY,
    tier_id int NOT NULL,
    points int NOT NULL CONSTRAINT DF_customer_loyalty_points DEFAULT 0
        CONSTRAINT CK_customer_loyalty_points CHECK (points >= 0),
    enrolled_at date NOT NULL CONSTRAINT DF_customer_loyalty_enrolled_at DEFAULT CAST(GETDATE() AS date),
    CONSTRAINT FK_customer_loyalty_customer
        FOREIGN KEY (customer_id) REFERENCES dbo.customer(customer_id),
    CONSTRAINT FK_customer_loyalty_tier
        FOREIGN KEY (tier_id) REFERENCES course_lab.loyalty_tier(tier_id)
);
GO

INSERT INTO course_lab.loyalty_tier
    (tier_name, minimum_spend, discount_percent)
VALUES
    (N'Bronze', 0, 0),
    (N'Silver', 100, 5),
    (N'Gold', 250, 10);

INSERT INTO course_lab.customer_loyalty (customer_id, tier_id)
SELECT
    c.customer_id,
    (SELECT TOP (1) tier_id FROM course_lab.loyalty_tier ORDER BY minimum_spend)
FROM dbo.customer AS c;
GO

CREATE OR ALTER VIEW course_lab.v_customer_loyalty_summary
AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    lt.tier_name,
    cl.points,
    COALESCE(SUM(p.amount), 0) AS lifetime_spend
FROM dbo.customer AS c
JOIN course_lab.customer_loyalty AS cl ON cl.customer_id = c.customer_id
JOIN course_lab.loyalty_tier AS lt ON lt.tier_id = cl.tier_id
LEFT JOIN dbo.payment AS p ON p.customer_id = c.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name,
    lt.tier_name, cl.points;
GO

CREATE OR ALTER PROCEDURE course_lab.usp_recalculate_loyalty
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        ;WITH customer_spend AS
        (
            SELECT c.customer_id, COALESCE(SUM(p.amount), 0) AS lifetime_spend
            FROM dbo.customer AS c
            LEFT JOIN dbo.payment AS p ON p.customer_id = c.customer_id
            GROUP BY c.customer_id
        )
        UPDATE cl
        SET tier_id =
        (
            SELECT TOP (1) lt.tier_id
            FROM course_lab.loyalty_tier AS lt
            WHERE lt.minimum_spend <= cs.lifetime_spend
            ORDER BY lt.minimum_spend DESC
        )
        FROM course_lab.customer_loyalty AS cl
        JOIN customer_spend AS cs ON cs.customer_id = cl.customer_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

CREATE OR ALTER FUNCTION course_lab.ufn_late_fee
(
    @rental_id int,
    @daily_rate decimal(10, 2)
)
RETURNS decimal(10, 2)
AS
BEGIN
    DECLARE @days_late int;

    SELECT @days_late =
        CASE
            WHEN DATEDIFF(day, r.rental_date, COALESCE(r.return_date, GETDATE()))
                 > f.rental_duration
            THEN DATEDIFF(day, r.rental_date, COALESCE(r.return_date, GETDATE()))
                 - f.rental_duration
            ELSE 0
        END
    FROM dbo.rental AS r
    JOIN dbo.inventory AS i ON i.inventory_id = r.inventory_id
    JOIN dbo.film AS f ON f.film_id = i.film_id
    WHERE r.rental_id = @rental_id;

    RETURN CONVERT(decimal(10, 2), COALESCE(@days_late, 0) * @daily_rate);
END;
GO

EXEC course_lab.usp_recalculate_loyalty;

SELECT TOP (20)
    customer_id,
    customer_name,
    tier_name,
    points,
    lifetime_spend
FROM course_lab.v_customer_loyalty_summary
ORDER BY lifetime_spend DESC;

SELECT
    rental_id,
    course_lab.ufn_late_fee(rental_id, 1.50) AS estimated_late_fee
FROM dbo.rental;
```


