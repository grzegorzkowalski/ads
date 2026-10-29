# Module 12 — Make the design and execution better

## Mission

Advanced SQL is not only about getting a result. It is about choosing a sound model and proving that the database can execute important queries efficiently.

Run `sql/01_create_course_lab.sql` before starting this module.

## Exercise 1 — Add a useful index

Create an index supporting searches for rentals by customer and date. Then compare the execution plan before and after the index.

## Exercise 2 — Index junction tables correctly

Create the reverse-direction index needed when searching all films for an actor.

## Exercise 3 — Normalize an order table

The following columns are stored together:

```text
OrderID, CustomerName, CustomerPhone, ProductName,
ProductPrice, Category, Quantity, Discount, OrderDate
```

Design a 3NF structure with customers, products, orders, and order details.

## Exercise 4 — Performance reflection

Explain why an index on `film(title)` may not help a predicate written as `WHERE LOWER(title) = '...'`.

---

Instructor reference answers are stored separately in `readme_answers.md`.

