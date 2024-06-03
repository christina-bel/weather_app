import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🙈', style: TextStyle(fontSize: 64)),
          Text(
            LocaleKeys.errorWeatherTitle.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
}
