USE sakila;
GO

DECLARE @failures TABLE
(
    test_name nvarchar(200) NOT NULL,
    failure_message nvarchar(500) NOT NULL
);

IF DB_NAME() <> 'sakila'
    INSERT INTO @failures VALUES
    (N'Database context', N'The script must run in the sakila database.');

IF (SELECT COUNT(*) FROM sys.tables) < 16
    INSERT INTO @failures VALUES
    (N'Sakila table count', N'Expected at least 16 Sakila tables.');

IF OBJECT_ID('dbo.film', 'U') IS NULL
    INSERT INTO @failures VALUES
    (N'Film table', N'dbo.film does not exist.');

IF OBJECT_ID('dbo.customer', 'U') IS NULL
    INSERT INTO @failures VALUES
    (N'Customer table', N'dbo.customer does not exist.');

IF OBJECT_ID('dbo.rental', 'U') IS NULL
    INSERT INTO @failures VALUES
    (N'Rental table', N'dbo.rental does not exist.');

IF EXISTS
(
    SELECT 1
    FROM payment AS p
    LEFT JOIN customer AS c ON c.customer_id = p.customer_id
    WHERE c.customer_id IS NULL
)
    INSERT INTO @failures VALUES
    (N'Payment foreign-key check', N'A payment references a missing customer.');

IF EXISTS (SELECT 1 FROM @failures)
BEGIN
    SELECT * FROM @failures;
    THROW 51110, 'Course smoke tests failed.', 1;
END;

SELECT 'All course smoke tests passed.' AS test_result;

