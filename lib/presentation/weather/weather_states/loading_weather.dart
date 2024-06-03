import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('⛅', style: TextStyle(fontSize: 64)),
          Text(
            LocaleKeys.loadingWeatherTitle.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ],
      );
}
