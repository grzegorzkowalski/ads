# Module 17 — MongoDB answers

These are instructor reference answers. Keep this file out of the student-facing distribution when possible.

## Setup and Exercise 1

```javascript
show dbs;
use ads_mongo_training;
show collections;
db.weather.findOne();
```

## Exercise 2

```javascript
db.weather.find(
  { 'airTemperature.value': { $gt: 20 } },
  { _id: 0, station: 1, observationDate: 1, 'airTemperature.value': 1 }
);
```

## Exercise 3

```javascript
db.weather.countDocuments({ 'wind.speed': { $gt: 10 } });

db.weather.aggregate([
  { $match: { 'wind.speed': { $gt: 10 } } },
  { $count: 'matching_observations' }
]);
```

## Exercise 4

```javascript
db.weather.find(
  {},
  {
    _id: 0,
    station: 1,
    observationDate: 1,
    'airTemperature.value': 1,
    humidity: 1
  }
).sort({ 'airTemperature.value': -1 });
```

## Exercise 5

```javascript
db.weather.aggregate([
  {
    $group: {
      _id: '$station',
      averageTemperature: { $avg: '$airTemperature.value' },
      maximumHumidity: { $max: '$humidity' }
    }
  },
  { $sort: { averageTemperature: -1 } }
]);
```

## Exercise 6

```javascript
db.weather.find({ 'airTemperature.value': { $gt: 20 } })
  .explain('executionStats');
```

Record `executionStats.executionTimeMillis`, `totalDocsExamined`, and `totalKeysExamined` before adding the index.

## Exercise 7

```javascript
db.weather.createIndex({ 'airTemperature.value': 1 });

db.weather.find({ 'airTemperature.value': { $gt: 20 } })
  .explain('executionStats');
```

On a tiny dataset, a collection scan can still be competitive. The important learning outcome is understanding the winning plan and the examined-document/key counts.

## Exercise 8

```javascript
db.weather.updateMany(
  { humidity: { $gt: 90 } },
  { $set: { quality: 'review' } }
);

db.weather.find({ quality: 'review' });
```

## Exercise 9

```javascript
db.createCollection('validated_weather', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['station', 'observationDate', 'airTemperature'],
      properties: {
        station: { bsonType: 'string' },
        observationDate: { bsonType: 'date' },
        airTemperature: {
          bsonType: 'object',
          required: ['value'],
          properties: {
            value: { bsonType: 'double' }
          }
        }
      }
    }
  },
  validationLevel: 'strict',
  validationAction: 'error'
});

db.validated_weather.insertOne({ station: 'Invalid station' });
```

The final insert should fail because required fields are missing.

## Exercise 10

```javascript
db.weather.aggregate([
  {
    $group: {
      _id: '$station',
      observationCount: { $sum: 1 },
      averageTemperature: { $avg: '$airTemperature.value' },
      latestObservation: { $max: '$observationDate' }
    }
  },
  {
    $project: {
      _id: 0,
      station: '$_id',
      observationCount: 1,
      averageTemperature: 1,
      latestObservation: 1
    }
  },
  { $sort: { station: 1 } }
]);
```

