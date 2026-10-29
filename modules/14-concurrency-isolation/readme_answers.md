# Module 14 — Reason about concurrent work — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```sql
SELECT CASE transaction_isolation_level
           WHEN 0 THEN 'Unspecified'
           WHEN 1 THEN 'Read Uncommitted'
           WHEN 2 THEN 'Read Committed'
           WHEN 3 THEN 'Repeatable Read'
           WHEN 4 THEN 'Serializable'
           WHEN 5 THEN 'Snapshot'
       END AS isolation_level
FROM sys.dm_exec_sessions
WHERE session_id = @@SPID;
```

## Answer 2 — Answer

```sql
SET XACT_ABORT ON;
BEGIN TRANSACTION;

DECLARE @film_id int =
(
    SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR'
);

SELECT TOP (1)
    i.inventory_id,
    i.film_id,
    i.store_id
FROM inventory AS i WITH (UPDLOCK, READPAST, ROWLOCK)
WHERE i.film_id = @film_id
ORDER BY i.inventory_id;

-- Perform the business operation here.
-- Keep the lock only for the shortest useful period.

ROLLBACK TRANSACTION;
```

## Answer 3 — Answer

- `UPDLOCK` takes update locks while reading rows that may later be changed.
- `HOLDLOCK` applies serializable semantics for the table reference until the transaction ends.
- `READPAST` skips incompatible locked rows instead of waiting for them.

These hints solve specific queue or reservation patterns; they should not be added without understanding the workload.

## Answer 4 — Answer

Correctness and concurrency are separate concerns. A transaction may hold locks for too long, access tables in an inconsistent order, or scan many rows. Keep transactions short, access objects consistently, and make predicates/indexes selective.


