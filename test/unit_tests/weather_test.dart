import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/models/weather/weather.dart';

void main() {
  group('Weather', () {
    test(
      'Returns correct Weather object',
      () {
        final json = <String, dynamic>{
          'temperature': 15.3,
          'weathercode': 63,
        };

        expect(
          Weather.fromJson(json),
          isA<Weather>()
              .having((w) => w.temperature, 'temperature', 15.3)
              .having((w) => w.weatherCode, 'weatherCode', 63),
        );
      },
    );
  });
}
