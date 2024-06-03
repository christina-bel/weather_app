import 'package:dio/dio.dart';
import 'package:weather_app/data/api/network/services/api_service_base.dart';
import 'package:weather_app/data/api/network/services/weather_api/weather_api_params.dart';
import 'package:weather_app/data/api/network/services/weather_api/weather_api_paths.dart';

/// Class is used for manipulating with api calls for current weather
class WeatherApi extends ApiServiceBase {
  WeatherApi({super.baseUrl = WeatherApiPaths.baseUrl});

  Future<Response> getWeather({
    required double lat,
    required double lon,
  }) async {
    final query = {
      WeatherApiParams.latitude: lat,
      WeatherApiParams.longitude: lon,
      WeatherApiParams.currentWeather: 'true',
    };
    final response = await dio.get(
      WeatherApiPaths.forecast,
      queryParameters: query,
    );

    return response;
  }
}
