# Module 08b — Alter tables — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
ALTER TABLE course_lab.rental_copy
ADD CONSTRAINT FK_rental_copy_customer_copy
    FOREIGN KEY (customer_id) REFERENCES course_lab.customer_copy(customer_id);

ALTER TABLE course_lab.rental_copy
DROP CONSTRAINT FK_rental_copy_customer_copy;
```

The constraint is dropped from the table that owns it (`rental_copy`), not from the referenced table. Sakila `rental` already has such a key, so adding it again would create a duplicate.

## Answer 2 — Answer

```sql
ALTER TABLE course_lab.customer_copy
ADD second_email varchar(100) NULL
    CONSTRAINT UQ_customer_copy_second_email UNIQUE;
```

SQL Server treats `NULL` as a value in a unique constraint: only one row may have `NULL`. A second `NULL` fails with a duplicate-key error. Use a filtered unique index (`WHERE second_email IS NOT NULL`) to allow many `NULL`s.

## Answer 3 — Answer

```sql
EXEC sp_rename 'course_lab.actor_copy', 'performer_copy';

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'performer_copy';

EXEC sp_rename 'course_lab.performer_copy', 'actor_copy';
```

The new name is given without the schema.

## Answer 4 — Answer

```sql
ALTER TABLE course_lab.address_copy ADD city varchar(50) NULL;
GO

UPDATE a
SET a.city = c.city
FROM course_lab.address_copy AS a
JOIN city AS c ON c.city_id = a.city_id;

SELECT TOP (5) address_id, city_id, city
FROM course_lab.address_copy
ORDER BY address_id;

ALTER TABLE course_lab.address_copy DROP COLUMN city;
```

`GO` is required: the batch must compile again before the new column can be used. Check the source column length first — `city.city` is `varchar(50)` — so 50 is enough.
