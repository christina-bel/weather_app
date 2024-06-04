import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';
import 'package:weather_app/presentation/weather/widgets/weather_background.dart';
import 'package:weather_app/presentation/weather/widgets/weather_icon.dart';

class PopulatedWeather extends StatelessWidget {
  final Weather _weather;
  final DateTime _updated;
  final TemperatureUnits _units;
  final ValueGetter<Future<void>> _onRefresh;

  const PopulatedWeather({
    required Weather weather,
    required DateTime updated,
    required TemperatureUnits units,
    required Future<void> Function() onRefresh,
    super.key,
  })  : _onRefresh = onRefresh,
        _units = units,
        _updated = updated,
        _weather = weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        const WeatherBackground(),
        RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  WeatherIcon(condition: _weather.condition),
                  Text(
                    _weather.locationName,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    formattedTemperature(_weather.temperature, _units),
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    LocaleKeys.populatedWeatherLastUpdated.tr(
                      namedArgs: {
                        'time':
                            TimeOfDay.fromDateTime(_updated).format(context),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String formattedTemperature(double temp, TemperatureUnits units) =>
      '${temp.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}';
}
