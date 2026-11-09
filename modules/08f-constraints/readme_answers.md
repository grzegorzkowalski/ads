# Module 08f — Constraints — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DROP TABLE IF EXISTS course_lab.customer_not_null;

CREATE TABLE course_lab.customer_not_null
(
    customer_id int NOT NULL CONSTRAINT PK_customer_not_null PRIMARY KEY,
    customer_name varchar(50) NOT NULL
);

INSERT INTO course_lab.customer_not_null (customer_id, customer_name) VALUES (1, 'Jan');   -- ok
INSERT INTO course_lab.customer_not_null (customer_id, customer_name) VALUES (2, NULL);    -- fails
```

## Answer 2 — Answer

```sql
DROP TABLE IF EXISTS course_lab.payment_check;

CREATE TABLE course_lab.payment_check
(
    payment_id int NOT NULL CONSTRAINT PK_payment_check PRIMARY KEY,
    amount decimal(5, 2) NOT NULL CONSTRAINT CK_payment_check_amount CHECK (amount > 0),
    payment_date date NOT NULL
);

INSERT INTO course_lab.payment_check VALUES (1, 4.99, '2026-01-10');    -- ok
INSERT INTO course_lab.payment_check VALUES (2, -5.00, '2026-01-10');   -- fails
```

## Answer 3 — Answer

```sql
ALTER TABLE course_lab.customer_not_null
ADD email varchar(100) NULL CONSTRAINT UQ_customer_not_null_email UNIQUE,
    created_at datetime2(0) NOT NULL
        CONSTRAINT DF_customer_not_null_created_at DEFAULT SYSUTCDATETIME();

INSERT INTO course_lab.customer_not_null (customer_id, customer_name, email) VALUES (3, 'Anna', 'a@example.com');
INSERT INTO course_lab.customer_not_null (customer_id, customer_name, email) VALUES (4, 'Ewa', 'a@example.com');   -- fails
```

Adding a `NOT NULL` column with a `DEFAULT` fills existing rows with the default value.
