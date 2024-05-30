import 'package:freezed_annotation/freezed_annotation.dart';

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
  const factory Weather({
    required double temperature,
    @JsonKey(name: 'weathercode') required double weatherCode,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}