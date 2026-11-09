# Module 12a — Query optimization

## Mission

Measure a query, add an index, and measure again. The first part uses MongoDB (see Module 17 for setup); the second repeats the idea in SQL Server.

## Part 1 — MongoDB

1. In MongoDB Compass create the database `weather` and import the `sample_weatherdata` JSON file from `https://github.com/neelabalan/mongodb-sample-dataset/tree/main/sample_weatherdata`.
2. In `mongosh` find every document where the air temperature is greater than 20.
3. Count the matching documents.
4. Run the query again with `explain("executionStats")`. Note `executionTimeMillis` and `totalDocsExamined`.
5. Create an index on `airTemperature.value` and compare the same two values.

## Part 2 — SQL Server

Create `course_lab.rental_copy` with `SELECT ... INTO` from `rental`. Query it by `customer_id`, look at the actual execution plan or `SET STATISTICS IO ON`, add an index on `customer_id`, and compare.

---

Instructor reference answers are stored separately in `readme_answers.md`.
