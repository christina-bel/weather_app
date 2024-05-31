import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_background.dart';
import 'package:weather_app/presentation/weather/widgets/weather_icon.dart';

class PopulatedWeather extends StatelessWidget {
  const PopulatedWeather({
    required this.weather,
    required this.lastUpdated,
    required this.onRefresh,
    super.key,
  });

  final Weather weather;
  final DateTime lastUpdated;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        const WeatherBackground(),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  WeatherIcon(condition: weather.condition),
                  Text(
                    weather.location ?? '',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    '${weather.temperature.toStringAsPrecision(2)}°C',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Last Updated at ${TimeOfDay.fromDateTime(lastUpdated).format(context)}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
