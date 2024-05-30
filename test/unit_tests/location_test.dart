import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/models/location/location.dart';

void main() {
  group('Location', () {
    test(
      'Returns correct Location object',
      () {
        final json = <String, dynamic>{
          'id': 4887398,
          'name': 'Chicago',
          'latitude': 41.85003,
          'longitude': -87.65005,
        };
        expect(
          Location.fromJson(json),
          isA<Location>()
              .having((l) => l.id, 'id', 4887398)
              .having((w) => w.name, 'name', 'Chicago')
              .having((w) => w.latitude, 'latitude', 41.85003)
              .having((w) => w.longitude, 'longitude', -87.65005),
        );
      },
    );
  });
}
