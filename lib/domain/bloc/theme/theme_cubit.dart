import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/models/weather/weather_condition.dart';

/// Class is used to manage the theme of the app.
/// The theme will change based on the current weather conditions.
class ThemeCubit extends HydratedCubit<Color> {
  static const _jsonKey = 'color';
  static const defaultColor = Color(0xFFCAF4FF);

  ThemeCubit() : super(defaultColor);

  @override
  Color fromJson(Map<String, dynamic> json) =>
      Color(int.parse(json[_jsonKey] as String));

  @override
  Map<String, dynamic> toJson(Color state) =>
      <String, String>{_jsonKey: '${state.value}'};

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.yellow;
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigoAccent;
      case WeatherCondition.unknown:
        return ThemeCubit.defaultColor;
    }
  }
}
