import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();

  static Route<void> route(WeatherCubit cubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const SettingsPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.settingsTitle.tr())),
        body: ListView(
          children: <Widget>[
            BlocBuilder<WeatherCubit, WeatherState>(
              buildWhen: (previous, current) => previous.units != current.units,
              builder: (ctx, state) => ListTile(
                title: Text(LocaleKeys.temperatureUnitsTitle.tr()),
                isThreeLine: true,
                subtitle: Text(LocaleKeys.temperatureUnitsSubtitle.tr()),
                trailing: Switch(
                  value: state.units.isCelsius,
                  onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
                ),
              ),
            ),
          ],
        ),
      );
}
