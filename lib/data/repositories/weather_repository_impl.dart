import 'package:weather_app/data/api/network/services/weather_api/weather_api.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends IWeatherRepository {
  WeatherRepositoryImpl(this._weatherApi);

  final WeatherApi _weatherApi;

  @override
  Future<Weather?> getWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await _weatherApi.getWeather(lat: lat, lon: lon);

      return WeatherResponse.fromJson(response.data).currentWeather;
    } catch (e) {
      rethrow;
    }
  }
}
