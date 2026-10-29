use('ads_mongo_training');

db.weather.drop();

db.weather.insertMany([
  {
    station: 'Warsaw-01',
    observationDate: ISODate('2026-01-10T08:00:00Z'),
    airTemperature: { value: 21.4, unit: 'C' },
    humidity: 71,
    wind: { speed: 4.2, unit: 'm/s' }
  },
  {
    station: 'Warsaw-01',
    observationDate: ISODate('2026-01-10T12:00:00Z'),
    airTemperature: { value: 25.7, unit: 'C' },
    humidity: 64,
    wind: { speed: 7.3, unit: 'm/s' }
  },
  {
    station: 'Warsaw-01',
    observationDate: ISODate('2026-01-11T12:00:00Z'),
    airTemperature: { value: 18.2, unit: 'C' },
    humidity: 93,
    wind: { speed: 12.1, unit: 'm/s' }
  },
  {
    station: 'Gdansk-01',
    observationDate: ISODate('2026-01-10T08:00:00Z'),
    airTemperature: { value: 16.8, unit: 'C' },
    humidity: 82,
    wind: { speed: 10.5, unit: 'm/s' }
  },
  {
    station: 'Gdansk-01',
    observationDate: ISODate('2026-01-10T12:00:00Z'),
    airTemperature: { value: 22.1, unit: 'C' },
    humidity: 78,
    wind: { speed: 13.8, unit: 'm/s' }
  },
  {
    station: 'Gdansk-01',
    observationDate: ISODate('2026-01-11T12:00:00Z'),
    airTemperature: { value: 19.4, unit: 'C' },
    humidity: 91,
    wind: { speed: 8.6, unit: 'm/s' }
  },
  {
    station: 'Krakow-01',
    observationDate: ISODate('2026-01-10T08:00:00Z'),
    airTemperature: { value: 20.0, unit: 'C' },
    humidity: 69,
    wind: { speed: 3.8, unit: 'm/s' }
  },
  {
    station: 'Krakow-01',
    observationDate: ISODate('2026-01-10T12:00:00Z'),
    airTemperature: { value: 27.3, unit: 'C' },
    humidity: 58,
    wind: { speed: 5.4, unit: 'm/s' }
  }
]);

print(`Seeded ${db.weather.countDocuments()} weather observations.`);

