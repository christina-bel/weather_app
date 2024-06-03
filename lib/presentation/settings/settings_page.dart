import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';

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
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          children: <Widget>[
            BlocBuilder<WeatherCubit, WeatherState>(
              buildWhen: (previous, current) => previous.units != current.units,
              builder: (ctx, state) => ListTile(
                title: const Text('Temperature Units'),
                isThreeLine: true,
                subtitle: const Text(
                  'Use metric measurements for temperature units (°F/°C)',
                ),
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
