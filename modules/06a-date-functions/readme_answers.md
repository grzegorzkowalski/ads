# Module 06a — Date functions — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT
    customer_id,
    create_date,
    DATEPART(year, create_date) AS year_created,
    DATEPART(month, create_date) AS month_created,
    DATEPART(day, create_date) AS day_created
FROM customer
ORDER BY customer_id;
```

## Answer 2 — Answer

```sql
SELECT
    ROUND(AVG(CAST(length AS decimal(10, 2))) * 60, 2) AS avg_length_seconds
FROM film;
```

`AVG(length)` on an integer column returns an integer, so cast before averaging.

## Answer 3 — Answer

```sql
SELECT TOP (20)
    rental_id,
    rental_date,
    return_date,
    DATEDIFF(DAY, rental_date, return_date) AS days_kept,
    DATEADD(DAY, 7, rental_date) AS date_plus_7_days
FROM rental
WHERE return_date IS NOT NULL
ORDER BY days_kept DESC, rental_id;
```

## Answer 4 — Answer

```sql
SELECT
    GETDATE() AS get_date,
    SYSDATETIME() AS sys_date_time,
    GETUTCDATE() AS utc_date;
```

`SYSDATETIME()` returns `datetime2(7)`, the highest precision.

## Answer 5 — Answer

```sql
SELECT
    DATEPART(month, rental_date) AS rental_month,
    COUNT(*) AS rental_count
FROM rental
WHERE DATEPART(year, rental_date) = (SELECT MIN(DATEPART(year, rental_date)) FROM rental)
GROUP BY DATEPART(month, rental_date)
ORDER BY rental_month;
```
