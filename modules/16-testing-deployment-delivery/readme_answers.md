# Module 16 — Test, package, and deliver database changes — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DECLARE @table_count int =
(
    SELECT COUNT(*)
    FROM sys.tables
);

IF @table_count < 16
    THROW 51100, 'Sakila environment verification failed.', 1;

SELECT 'Environment test passed.' AS test_result;
```

## Answer 2 — Answer

```sql
IF NOT EXISTS
(
    SELECT 1
    FROM course_lab.v_customer_directory
)
    THROW 51101, 'Customer directory view returned no rows.', 1;

SELECT 'View contract test passed.' AS test_result;
```

## Answer 3 — Answer

```sql
IF OBJECT_ID('course_lab.migration_log', 'U') IS NULL
BEGIN
    CREATE TABLE course_lab.migration_log
    (
        migration_id int IDENTITY(1, 1) CONSTRAINT PK_migration_log PRIMARY KEY,
        migration_name sysname NOT NULL CONSTRAINT UQ_migration_log_name UNIQUE,
        applied_at datetime2(0) NOT NULL CONSTRAINT DF_migration_log_applied_at DEFAULT SYSUTCDATETIME()
    );
END;
```

## Answer 4 — Reference checklist

```text
[ ] Clean Docker environment tested
[ ] All scripts run in order
[ ] Scripts can be run a second time or clearly state why not
[ ] Acceptance tests pass
[ ] Foreign keys and uniqueness rules tested
[ ] Transaction failure path tested
[ ] Permissions documented
[ ] Performance comparison recorded
[ ] README is sufficient for a new student
```


