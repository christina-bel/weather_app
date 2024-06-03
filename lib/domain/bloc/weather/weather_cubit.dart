import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

part 'weather_cubit.freezed.dart';
part 'weather_cubit.g.dart';
part 'weather_state.dart';

/// Class is used to manage weather state for the main purpose of yhe app.
class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherRepository _weatherRepo;
  final ILocationRepository _locationRepo;

  WeatherCubit(this._weatherRepo, this._locationRepo)
      : super(WeatherState.initial());

  /// Method is used for retrieving a weather object for the given city
  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) {
      return;
    }

    _changeState(status: WeatherStatus.loading, weather: Weather.empty());
    try {
      final location = await _locationRepo.getLocation(city);

      final weather = await _weatherRepo.getWeather(
        lat: location.latitude,
        lon: location.longitude,
      );

      final units = state.units;
      final temp = units.isFahrenheit
          ? weather.temperature.toFahrenheit()
          : weather.temperature;

      _changeState(
        status: WeatherStatus.success,
        units: units,
        weather: weather.copyWith(location: city, temperature: temp),
        updated: DateTime.now(),
      );
    } catch (e) {
      _changeState(status: WeatherStatus.failure, weather: Weather.empty());
    }
  }

  /// Toggles the state between Celsius and Fahrenheit units
  void toggleUnits() {
    final units = state.units.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (!state.status.isSuccess) {
      _changeState(units: units);
      return;
    }

    final weather = state.weather;
    final temp = units.isCelsius
        ? weather.temperature.toCelsius()
        : weather.temperature.toFahrenheit();
    _changeState(
      units: units,
      weather: weather.copyWith(temperature: temp),
    );
  }

  void _changeState({
    WeatherStatus? status,
    TemperatureUnits? units,
    Weather? weather,
    DateTime? updated,
  }) =>
      emit(
        state.copyWith(
          status: status ?? state.status,
          units: units ?? state.units,
          weather: weather ?? state.weather,
          lastUpdated: updated ?? state.lastUpdated,
        ),
      );
}
