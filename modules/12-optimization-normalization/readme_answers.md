# Module 12 — Make the design and execution better — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE INDEX IX_rental_customer_rental_date
ON dbo.rental (customer_id, rental_date DESC)
INCLUDE (inventory_id, return_date, staff_id);
```

In VS Code or DataGrip, enable the actual execution plan and compare logical reads, scans, seeks, and estimated cost. An index is not automatically beneficial: measure the query that matters.

## Answer 2 — Answer

```sql
CREATE INDEX IX_film_actor_actor_film
ON dbo.film_actor (actor_id, film_id);
```

The existing composite primary key starts with `actor_id` or `film_id` depending on the port. Inspect the current indexes before creating a duplicate index.

## Answer 3 — Answer

```sql
CREATE TABLE course_lab.customer_3nf
(
    customer_id int IDENTITY(1, 1) CONSTRAINT PK_customer_3nf PRIMARY KEY,
    customer_name nvarchar(100) NOT NULL,
    customer_phone varchar(30) NULL
);

CREATE TABLE course_lab.product_3nf
(
    product_id int IDENTITY(1, 1) CONSTRAINT PK_product_3nf PRIMARY KEY,
    product_name nvarchar(100) NOT NULL,
    category_name nvarchar(100) NOT NULL,
    product_price decimal(10, 2) NOT NULL
        CONSTRAINT CK_product_3nf_price CHECK (product_price >= 0)
);

CREATE TABLE course_lab.order_3nf
(
    order_id int IDENTITY(1, 1) CONSTRAINT PK_order_3nf PRIMARY KEY,
    customer_id int NOT NULL,
    order_date date NOT NULL,
    CONSTRAINT FK_order_3nf_customer
        FOREIGN KEY (customer_id) REFERENCES course_lab.customer_3nf(customer_id)
);

CREATE TABLE course_lab.order_detail_3nf
(
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity int NOT NULL CONSTRAINT CK_order_detail_3nf_quantity CHECK (quantity > 0),
    discount decimal(10, 2) NOT NULL DEFAULT 0
        CONSTRAINT CK_order_detail_3nf_discount CHECK (discount >= 0),
    CONSTRAINT PK_order_detail_3nf PRIMARY KEY (order_id, product_id),
    CONSTRAINT FK_order_detail_3nf_order
        FOREIGN KEY (order_id) REFERENCES course_lab.order_3nf(order_id),
    CONSTRAINT FK_order_detail_3nf_product
        FOREIGN KEY (product_id) REFERENCES course_lab.product_3nf(product_id)
);
```

## Answer 4 — Answer

Applying a function to the indexed column can make the predicate non-sargable. Prefer a matching collation, a persisted computed column with an index, or a predicate that allows SQL Server to use the existing index.


