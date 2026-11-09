# Module 08c — Drop tables — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
CREATE TABLE course_lab.employees
(
    id int NOT NULL CONSTRAINT PK_employees PRIMARY KEY,
    name varchar(50)
);

DROP TABLE course_lab.employees;
```

## Answer 2 — Answer

```sql
IF OBJECT_ID('course_lab.temporary_table', 'U') IS NOT NULL
    DROP TABLE course_lab.temporary_table;

DROP TABLE IF EXISTS course_lab.temporary_table;   -- SQL Server 2016+
```

## Answer 3 — Answer

```sql
CREATE TABLE course_lab.parent_t (id int NOT NULL CONSTRAINT PK_parent_t PRIMARY KEY);
CREATE TABLE course_lab.child_t
(
    id int NOT NULL CONSTRAINT PK_child_t PRIMARY KEY,
    parent_id int NOT NULL CONSTRAINT FK_child_t_parent_t REFERENCES course_lab.parent_t(id)
);

DROP TABLE course_lab.parent_t;   -- fails: referenced by a FOREIGN KEY constraint

DROP TABLE course_lab.child_t;    -- drop the child first
DROP TABLE course_lab.parent_t;
```
