# Module 17 — Optional MongoDB track

This is an optional document-database track. It does not replace the SQL Server modules. Use it to compare relational modelling with document modelling, CRUD operations, aggregation pipelines, indexes, and query plans.

## Tools

- Docker Desktop;
- MongoDB Compass for visual exploration;
- `mongosh` for repeatable commands and scripts.

MongoDB Community runs in a separate container so that the SQL Server environment remains unchanged.

## Start MongoDB

From the `ads2026` directory:

```powershell
docker compose -f docker-compose.mongo.yml up -d
docker compose -f docker-compose.mongo.yml ps
```

Connect with:

```text
mongodb://localhost:27017
```

Or use the shell inside the container:

```powershell
docker exec -it ads2026-mongodb mongosh
```

Load the training data:

```powershell
mongosh "mongodb://localhost:27017/ads_mongo_training" modules/17-mongodb/scripts/seed.js
```

The seed script creates a small weather dataset designed for learning. It is deterministic and can be rerun after resetting the database.

## Exercise 1 — Inspect the document model

List databases, select `ads_mongo_training`, list collections, and inspect one weather document.

## Exercise 2 — Filter documents

Find observations where `airTemperature.value` is greater than 20. Return the station, date, and temperature.

## Exercise 3 — Count matching documents

Count observations where wind speed is greater than 10. Compare `countDocuments()` with an aggregation `$count` stage.

## Exercise 4 — Project and sort

Return only station name, observation date, temperature, and humidity. Sort from the highest temperature to the lowest.

## Exercise 5 — Aggregate by station

Calculate the average temperature and maximum humidity for each station.

## Exercise 6 — Explain a query

Run the temperature query with `explain('executionStats')`. Record `executionTimeMillis`, `totalDocsExamined`, and `totalKeysExamined`.

## Exercise 7 — Create and evaluate an index

Create an index on `airTemperature.value`. Run the explained query again and compare the execution statistics. Explain why a small dataset may not show a dramatic speed improvement.

## Exercise 8 — Update documents safely

Add a `quality` field with value `review` to observations where humidity is above 90. Verify the modified count and inspect the changed documents.

## Exercise 9 — Validate document shape

Create a collection validator requiring `station`, `observationDate`, and `airTemperature.value`. Attempt to insert an invalid document and explain the result.

## Exercise 10 — Produce a report document

Create a pipeline that groups observations by station and returns a report containing station name, observation count, average temperature, and the latest observation date.

## Reset

```powershell
docker compose -f docker-compose.mongo.yml down
docker compose -f docker-compose.mongo.yml up -d
```

The training container is disposable. Run the seed script again after the container is ready.

## Official documentation

- <https://www.mongodb.com/docs/v8.0/tutorial/install-mongodb-community-with-docker/>
- <https://www.mongodb.com/docs/mongodb-shell/>
- <https://www.mongodb.com/docs/compass/install/>

Instructor reference answers are stored separately in `readme_answers.md`.

