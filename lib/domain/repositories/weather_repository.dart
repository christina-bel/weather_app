import 'package:weather_app/domain/models/weather/weather.dart';

abstract class IWeatherRepository {
  /// Fetches [Weather] for given [lat] and [lon].
  Future<Weather> getWeather({
    required double lat,
    required double lon,
  });
}
