# Module 08 — Design reliable tables — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
USE sakila;
GO

IF OBJECT_ID('course_lab.customer_note', 'U') IS NOT NULL
    DROP TABLE course_lab.customer_note;
GO

CREATE TABLE course_lab.customer_note
(
    customer_note_id int IDENTITY(1, 1)
        CONSTRAINT PK_customer_note PRIMARY KEY,
    customer_id int NOT NULL,
    note_text nvarchar(500) NOT NULL,
    created_at datetime2(0) NOT NULL
        CONSTRAINT DF_customer_note_created_at DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_customer_note_customer
        FOREIGN KEY (customer_id) REFERENCES dbo.customer(customer_id),
    CONSTRAINT CK_customer_note_text
        CHECK (LEN(LTRIM(RTRIM(note_text))) > 0)
);
```

## Answer 2 — Answer

```sql
CREATE TABLE course_lab.film_tag
(
    film_tag_id int IDENTITY(1, 1)
        CONSTRAINT PK_film_tag PRIMARY KEY,
    tag_name nvarchar(50) NOT NULL
        CONSTRAINT UQ_film_tag_name UNIQUE
);

CREATE TABLE course_lab.film_tag_map
(
    film_id int NOT NULL,
    film_tag_id int NOT NULL,
    CONSTRAINT PK_film_tag_map PRIMARY KEY (film_id, film_tag_id),
    CONSTRAINT FK_film_tag_map_film
        FOREIGN KEY (film_id) REFERENCES dbo.film(film_id),
    CONSTRAINT FK_film_tag_map_tag
        FOREIGN KEY (film_tag_id) REFERENCES course_lab.film_tag(film_tag_id)
);
```

## Answer 3 — Answer

```sql
SELECT
    c.column_id,
    c.name AS column_name,
    t.name AS data_type,
    c.max_length,
    c.is_nullable
FROM sys.columns AS c
JOIN sys.types AS t ON t.user_type_id = c.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.customer')
ORDER BY c.column_id;
```


