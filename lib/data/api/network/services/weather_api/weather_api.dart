import 'package:dio/dio.dart';
import 'package:weather_app/data/api/network/services/api_service_base.dart';
import 'package:weather_app/data/api/network/services/weather_api/weather_api_params.dart';
import 'package:weather_app/data/api/network/services/weather_api/weather_api_paths.dart';

class WeatherApi extends ApiServiceBase {
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
