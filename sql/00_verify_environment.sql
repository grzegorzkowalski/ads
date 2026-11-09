USE sakila;
GO





SELECT
    DB_NAME() AS database_name,
    CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(50)) AS sql_server_version,
    CAST(SERVERPROPERTY('Edition') AS nvarchar(100)) AS sql_server_edition;

SELECT COUNT(*) AS table_count
FROM sys.tables;

SELECT COUNT(*) AS view_count
FROM sys.views;

SELECT
    t.name AS table_name,
    SUM(p.rows) AS row_count
FROM sys.tables AS t
JOIN sys.partitions AS p
    ON p.object_id = t.object_id
   AND p.index_id IN (0, 1)
GROUP BY t.name
ORDER BY t.name;

SELECT TOP (5)
    film_id,
    title,
    release_year,
    rental_rate
FROM dbo.film
ORDER BY title;

SELECT
    OBJECT_SCHEMA_NAME(parent_object_id) AS table_schema,
    OBJECT_NAME(parent_object_id) AS table_name,
    name AS constraint_name,
    type_desc
FROM sys.foreign_keys
ORDER BY table_name, constraint_name;

