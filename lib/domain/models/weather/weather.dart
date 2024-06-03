import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domain/models/weather/weather_condition.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    @JsonKey(name: 'current_weather') Weather? currentWeather,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, Object?> json) =>
      _$WeatherResponseFromJson(json);
}

@freezed
class Weather with _$Weather {
  const Weather._();

  const factory Weather({
    required double temperature,
    @JsonKey(name: 'weathercode') required int weatherCode,
    String? location,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);

  factory Weather.empty() => const Weather(temperature: -1, weatherCode: -1);

  WeatherCondition get condition => weatherCode.toCondition;
}
