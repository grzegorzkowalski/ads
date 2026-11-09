# Module 08e — Foreign keys

## Mission

Foreign keys keep related tables consistent. Build a small order model and a link table with two foreign keys.

## Exercise 1 — Orders and details

Create `course_lab.Orders` (`OrderID`, `CustomerID`, `OrderDate`) and `course_lab.OrderDetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`). Add a primary key to each table and a foreign key from `OrderDetails.OrderID` to `Orders`. Which columns make the best keys?

## Exercise 2 — Two foreign keys

Create `course_lab.Managers` (`ManagerID`, `ManagerName`) and `course_lab.OrderAssignments` (`AssignmentID`, `ManagerID`, `OrderID`) with foreign keys to both parent tables.

## Exercise 3 — Prove it

Insert an `OrderDetails` row that points to a non-existing order. What happens?

---

Instructor reference answers are stored separately in `readme_answers.md`.
