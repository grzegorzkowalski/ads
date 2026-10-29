# Project 2 — Directors and Awards Extension

## Scenario

Sakila Video wants to enrich its catalogue with directors and awards. Build an extension without changing the reference Sakila tables.

## Requirements

Create objects in the `course_lab` schema:

1. `director` with at least 10 directors;
2. `award` with at least 5 awards;
3. `film_director` for the film/director many-to-many relationship;
4. `film_award` for awards assigned to films;
5. `director_award` for awards assigned to directors;
6. composite primary keys on all junction tables;
7. foreign keys and uniqueness constraints;
8. `v_film_awards`;
9. `v_director_awards`;
10. `usp_add_award` with optional film and director assignment;
11. `ufn_get_award_count`;
12. at least four analysis queries;
13. indexes justified with an execution plan;
14. a short architecture diagram and test evidence.

Use `INT` for all new `film_id` columns because the SQL Server Sakila image uses `INT` for `film.film_id`.

## Acceptance tests

```sql
SELECT COUNT(*) AS director_count FROM course_lab.director;
SELECT COUNT(*) AS award_count FROM course_lab.award;
SELECT COUNT(*) AS film_director_count FROM course_lab.film_director;
SELECT COUNT(*) AS film_award_count FROM course_lab.film_award;
SELECT COUNT(*) AS director_award_count FROM course_lab.director_award;

SELECT * FROM course_lab.v_film_awards;
SELECT * FROM course_lab.v_director_awards;
```

## Reference implementation

The following is a complete reference implementation. Run it in the disposable lab after running `sql/01_create_course_lab.sql`.

## Optional trigger extension

Implement a trigger only after the core project is tested. The trigger must look up the default award by its natural key, not assume that its ID is `1`, and must use a set-based statement for multi-row inserts.

---

Instructor reference answers are stored separately in `readme_answers.md`.

