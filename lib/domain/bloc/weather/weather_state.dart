part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@freezed
class WeatherState with _$WeatherState {
  @JsonSerializable(explicitToJson: true)
  const factory WeatherState({
    required WeatherStatus status,
    required TemperatureUnits units,
    required Weather weather,
    DateTime? lastUpdated,
  }) = _WeatherState;

  factory WeatherState.initial() => WeatherState(
        status: WeatherStatus.initial,
        units: TemperatureUnits.celsius,
        weather: Weather.empty(),
      );

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}
