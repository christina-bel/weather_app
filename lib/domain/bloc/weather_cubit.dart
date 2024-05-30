import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherRepository _weatherRepository;
  final ILocationRepository _locationRepository;

  WeatherCubit(this._weatherRepository, this._locationRepository)
      : super(const Initial());

  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) {
      return;
    }

    _changeState(const Loading());

    try {
      final location = await _locationRepository.getLocation(city);

      final weather = await _weatherRepository.getWeather(
        lat: location.latitude,
        lon: location.longitude,
      );

      _changeState(
        CurrentWeather(
          weather: weather.copyWith(location: city),
          lastUpdated: DateTime.now(),
          temperatureUnits: TemperatureUnits.celsius,
        ),
      );
    } catch (e) {
      _changeState(Failure(e.toString()));
    }
  }

  void _changeState(WeatherState newState) => emit(newState);
}
