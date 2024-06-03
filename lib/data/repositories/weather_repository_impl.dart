import 'package:weather_app/data/api/network/services/weather_api/weather_api.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends IWeatherRepository {
  final WeatherApi _api;

  WeatherRepositoryImpl({WeatherApi? api}) : _api = api ?? WeatherApi();

  @override
  Future<Weather> getWeather({
    required double lat,
    required double lon,
  }) async {
    final response = await _api.getWeather(lat: lat, lon: lon);

    final weather = WeatherResponse.fromJson(response.data).currentWeather;
    if (weather == null) {
      throw Exception('Not found current weather');
    }
    return weather;
  }
}
