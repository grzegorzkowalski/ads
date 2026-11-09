# Module 06c — Data types, CAST and CONVERT — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer'
ORDER BY ORDINAL_POSITION;
```

`EXEC sp_help 'customer';` shows the same plus keys and constraints.

## Answer 2 — Answer

Reference reasoning (do not run `ALTER`):

- `customer_id` `smallint` → `int`: `smallint` stops at 32,767 rows; `int` is safer if the business grows. Cost: 2 more bytes per row and per index entry.
- `email` `varchar(50)` → `varchar(100)`: some valid addresses are longer than 50 characters.
- `active` `bit`: already optimal for yes/no. Use `tinyint` only if more states are needed (0 inactive, 1 active, 2 suspended).
- `create_date` `datetime` → `date`: if the time of day is not needed, `date` uses 3 bytes instead of 8.

## Answer 3 — Answer

```sql
SELECT
    CAST('123' AS int) AS integer_value,
    CAST('3.14' AS float) AS float_value,
    CAST(42 AS decimal(5, 2)) AS decimal_value,
    CAST('2023-01-25' AS datetime) AS datetime_value;
```

## Answer 4 — Answer

```sql
SELECT TOP (10)
    customer_id,
    CONVERT(varchar(10), create_date, 103) AS style_103,
    CONVERT(varchar(8), create_date, 4) AS style_4,
    CONVERT(varchar(10), create_date, 104) AS style_104
FROM customer
ORDER BY customer_id;
```

Style 103 is `dd/mm/yyyy`, style 4 is `dd.mm.yy` (two-digit year), style 104 is `dd.mm.yyyy`.

## Answer 5 — Answer

```sql
SELECT
    v.raw_value,
    TRY_CONVERT(int, v.raw_value) AS as_int,
    TRY_CONVERT(date, v.raw_value) AS as_date
FROM (VALUES ('10'), ('abc'), ('2026-02-30')) AS v(raw_value);
```

`CAST` and `CONVERT` raise an error on invalid input; `TRY_CONVERT` returns `NULL`.
