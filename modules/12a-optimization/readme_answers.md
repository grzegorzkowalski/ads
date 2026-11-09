# Module 12a — Query optimization — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Part 1 — Answer

```javascript
use weather
db.data.find({ "airTemperature.value": { $gt: 20 } })
db.data.countDocuments({ "airTemperature.value": { $gt: 20 } })

db.data.find({ "airTemperature.value": { $gt: 20 } }).explain("executionStats")
// before: winningPlan stage COLLSCAN, totalDocsExamined == collection size

db.data.createIndex({ "airTemperature.value": 1 })

db.data.find({ "airTemperature.value": { $gt: 20 } }).explain("executionStats")
// after: IXSCAN + FETCH, totalDocsExamined == number of matching documents
```

The collection name depends on the imported file; use the name Compass shows. An index helps when the filter is selective; if most documents match, the planner may still scan.

## Part 2 — Answer

```sql
DROP TABLE IF EXISTS course_lab.rental_copy;
SELECT * INTO course_lab.rental_copy FROM dbo.rental;

SET STATISTICS IO ON;
SELECT rental_id, rental_date FROM course_lab.rental_copy WHERE customer_id = 148;   -- table scan

CREATE INDEX IX_rental_copy_customer_id ON course_lab.rental_copy (customer_id) INCLUDE (rental_date);

SELECT rental_id, rental_date FROM course_lab.rental_copy WHERE customer_id = 148;   -- index seek
SET STATISTICS IO OFF;
```

Compare `logical reads` before and after. Indexes speed up reads but cost space and slow `INSERT`, `UPDATE`, and `DELETE`.
