part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;

  const factory WeatherState.loading() = Loading;

  const factory WeatherState.success({
    required Weather weather,
    required DateTime lastUpdated,
    required TemperatureUnits temperatureUnits,
  }) = CurrentWeather;

  const factory WeatherState.failure(String? message) = Failure;
}
