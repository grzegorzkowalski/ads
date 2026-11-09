# Module 08e — Foreign keys — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
DROP TABLE IF EXISTS course_lab.OrderAssignments;
DROP TABLE IF EXISTS course_lab.OrderDetails;
DROP TABLE IF EXISTS course_lab.Managers;
DROP TABLE IF EXISTS course_lab.Orders;

CREATE TABLE course_lab.Orders
(
    OrderID int NOT NULL CONSTRAINT PK_Orders PRIMARY KEY,
    CustomerID int NOT NULL,
    OrderDate date NOT NULL
);

CREATE TABLE course_lab.OrderDetails
(
    OrderDetailID int NOT NULL CONSTRAINT PK_OrderDetails PRIMARY KEY,
    OrderID int NOT NULL,
    ProductID int NOT NULL,
    Quantity int NOT NULL,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES course_lab.Orders(OrderID)
);
```

The `ID` of each table is the natural primary key. `OrderID` in `OrderDetails` is a foreign key, not part of the primary key.

## Answer 2 — Answer

```sql
CREATE TABLE course_lab.Managers
(
    ManagerID int NOT NULL CONSTRAINT PK_Managers PRIMARY KEY,
    ManagerName varchar(50) NOT NULL
);

CREATE TABLE course_lab.OrderAssignments
(
    AssignmentID int NOT NULL CONSTRAINT PK_OrderAssignments PRIMARY KEY,
    ManagerID int NOT NULL,
    OrderID int NOT NULL,
    CONSTRAINT FK_OrderAssignments_Managers FOREIGN KEY (ManagerID) REFERENCES course_lab.Managers(ManagerID),
    CONSTRAINT FK_OrderAssignments_Orders FOREIGN KEY (OrderID) REFERENCES course_lab.Orders(OrderID)
);
```

## Answer 3 — Answer

```sql
INSERT INTO course_lab.OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES (1, 999, 1, 1);
```

The statement fails with a `FOREIGN KEY` conflict on `FK_OrderDetails_Orders`: order 999 does not exist.
