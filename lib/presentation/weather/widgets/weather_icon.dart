import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather/weather_condition.dart';

class WeatherIcon extends StatelessWidget {
  static const _iconSize = 75.0;

  final WeatherCondition _condition;

  const WeatherIcon({required WeatherCondition condition, super.key})
      : _condition = condition;

  @override
  Widget build(BuildContext context) => Text(
        _condition.toEmoji,
        style: const TextStyle(fontSize: _iconSize),
      );
}

extension on WeatherCondition {
  String get toEmoji {
    switch (this) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.snowy:
        return '🌨️';
      case WeatherCondition.unknown:
        return '❓';
    }
  }
}
