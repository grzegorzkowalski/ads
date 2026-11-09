# Module 08g — Database design — Answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Answer 1 — Answer

```javascript
db.visit_events.insertOne({
  branchId: 12,
  sensorId: "S-12-ENTRANCE-1",
  ts: ISODate("2026-03-02T09:15:03Z"),
  people: 2,
  direction: "in",
  visitType: "cash_desk",
  environment: { temperature: 21.5, noise: 48 }
});

db.visit_events.createIndex({ branchId: 1, ts: 1 });
db.visit_events.createIndex({ sensorId: 1, ts: 1 });
```

Events are written often and read by time range, so the compound `{ branchId, ts }` index covers the common query.

## Answer 2 — Answer

```sql
CREATE TABLE course_lab.branch
(
    branch_id int NOT NULL CONSTRAINT PK_branch PRIMARY KEY,
    branch_name nvarchar(100) NOT NULL,
    city nvarchar(100) NOT NULL,
    opens_at time(0) NOT NULL,
    closes_at time(0) NOT NULL,
    CONSTRAINT CK_branch_hours CHECK (opens_at < closes_at)
);

CREATE TABLE course_lab.sensor
(
    sensor_id int NOT NULL CONSTRAINT PK_sensor PRIMARY KEY,
    branch_id int NOT NULL CONSTRAINT FK_sensor_branch REFERENCES course_lab.branch(branch_id),
    placement nvarchar(50) NOT NULL
);

CREATE TABLE course_lab.visit_type
(
    visit_type_id tinyint NOT NULL CONSTRAINT PK_visit_type PRIMARY KEY,
    visit_type_name nvarchar(50) NOT NULL CONSTRAINT UQ_visit_type UNIQUE
);

CREATE TABLE course_lab.daily_visits
(
    visit_date date NOT NULL,
    branch_id int NOT NULL CONSTRAINT FK_daily_visits_branch REFERENCES course_lab.branch(branch_id),
    sensor_id int NOT NULL CONSTRAINT FK_daily_visits_sensor REFERENCES course_lab.sensor(sensor_id),
    visit_type_id tinyint NOT NULL CONSTRAINT FK_daily_visits_type REFERENCES course_lab.visit_type(visit_type_id),
    people_in int NOT NULL CONSTRAINT CK_daily_visits_in CHECK (people_in >= 0),
    people_out int NOT NULL CONSTRAINT CK_daily_visits_out CHECK (people_out >= 0),
    CONSTRAINT PK_daily_visits PRIMARY KEY (visit_date, sensor_id, visit_type_id)
);

CREATE INDEX IX_daily_visits_branch_date ON course_lab.daily_visits (branch_id, visit_date);
```

Weekly and monthly summaries can be views over `daily_visits` (see Module 09) so they cannot go out of sync. `branch_id` on `daily_visits` is derivable from the sensor, so keep it only if the reporting speed justifies the denormalization.

## Answer 3 — Answer

Check that the diagram shows: one branch to many sensors, one sensor to many daily rows, and a lookup table for visit types; the MongoDB diagram should show the embedded `environment` object.

## Answer 4 — Answer

```sql
-- Weekly visits for one branch
SELECT
    DATEPART(year, visit_date) AS visit_year,
    DATEPART(iso_week, visit_date) AS visit_week,
    SUM(people_in) AS people_in
FROM course_lab.daily_visits
WHERE branch_id = 12
GROUP BY DATEPART(year, visit_date), DATEPART(iso_week, visit_date)
ORDER BY visit_year, visit_week;
```

Compare the weeks before and after the campaign date. Hourly analysis needs the raw events (MongoDB) or an hourly table, because `daily_visits` has no time of day.
