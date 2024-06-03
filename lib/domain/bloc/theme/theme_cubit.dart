import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/models/weather/weather_condition.dart';

/// Class is used to manage the theme of the app.
/// The theme will change based on the current weather conditions.
class ThemeCubit extends Cubit<Color> {
  static const defaultColor = Color(0xFFCAF4FF);

  ThemeCubit() : super(defaultColor);

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
