# Module 13 — Protect the database — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT *
FROM sys.fn_my_permissions(NULL, 'DATABASE')
ORDER BY permission_name;
```

## Answer 2 — Answer

```sql
IF DATABASE_PRINCIPAL_ID('course_report_reader') IS NULL
    CREATE ROLE course_report_reader;
GO

GRANT SELECT ON SCHEMA::course_lab TO course_report_reader;
REVOKE EXECUTE ON SCHEMA::course_lab FROM course_report_reader;
GO

SELECT
    dp.name AS principal_name,
    p.permission_name,
    p.state_desc
FROM sys.database_principals AS dp
JOIN sys.database_permissions AS p
    ON p.grantee_principal_id = dp.principal_id
WHERE dp.name = 'course_report_reader';
```

## Answer 3 — Answer

```sql
GRANT EXECUTE ON OBJECT::course_lab.usp_films_by_category
TO course_report_reader;
```

## Answer 4 — Answer

`db_owner` grants full control, including changing or deleting data, altering objects, and managing permissions. A reporting role should receive only the minimum `SELECT` and explicitly required `EXECUTE` permissions.


