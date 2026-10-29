# Module 15 — Use JSON in SQL Server — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DECLARE @preferences nvarchar(max) =
N'{"preferredLanguage":"English","emailNotifications":true,"genres":["Comedy","Drama"]}';

SELECT
    JSON_VALUE(@preferences, '$.preferredLanguage') AS preferred_language,
    JSON_VALUE(@preferences, '$.emailNotifications') AS email_notifications;
```

## Answer 2 — Answer

```sql
DECLARE @preferences nvarchar(max) =
N'{"genres":["Comedy","Drama","Animation"]}';

SELECT [value] AS preferred_genre
FROM OPENJSON(@preferences, '$.genres');
```

## Answer 3 — Answer

```sql
CREATE TABLE course_lab.customer_preferences
(
    customer_id int CONSTRAINT PK_customer_preferences PRIMARY KEY,
    preferences_json nvarchar(max) NOT NULL,
    CONSTRAINT FK_customer_preferences_customer
        FOREIGN KEY (customer_id) REFERENCES dbo.customer(customer_id),
    CONSTRAINT CK_customer_preferences_json
        CHECK (ISJSON(preferences_json) = 1)
);
```

## Answer 4 — Answer

```sql
SELECT TOP (5)
    film_id,
    title,
    rental_rate
FROM film
ORDER BY rental_rate DESC, title
FOR JSON PATH;
```


