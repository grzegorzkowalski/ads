# Module 08d — Primary keys — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
IF OBJECT_ID('course_lab.customers', 'U') IS NOT NULL
    DROP TABLE course_lab.customers;

CREATE TABLE course_lab.customers
(
    CustomerID int NOT NULL CONSTRAINT PK_customers PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50)
);
```

## Answer 2 — Answer

```sql
IF OBJECT_ID('course_lab.clients_no_key', 'U') IS NOT NULL
    DROP TABLE course_lab.clients_no_key;

CREATE TABLE course_lab.clients_no_key
(
    ClientID int,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Address varchar(200),
    City varchar(50),
    Country varchar(50)
);

ALTER TABLE course_lab.clients_no_key
ADD ClientCode int IDENTITY(1, 1) NOT NULL;

ALTER TABLE course_lab.clients_no_key
ADD CONSTRAINT PK_clients_no_key PRIMARY KEY (ClientCode);
```

`IDENTITY` is T-SQL's auto-increment; there is no `AUTO_INCREMENT`.

## Answer 3 — Answer

```sql
INSERT INTO course_lab.customers (CustomerID, FirstName, LastName) VALUES (1, 'Jan', 'Kowalski');
INSERT INTO course_lab.customers (CustomerID, FirstName, LastName) VALUES (1, 'Anna', 'Nowak');
```

The second statement fails with a violation of the primary key constraint `PK_customers`.
