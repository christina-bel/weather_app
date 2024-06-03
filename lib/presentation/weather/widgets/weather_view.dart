import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/theme/theme_cubit.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/search/search_page.dart';
import 'package:weather_app/presentation/settings/settings_page.dart';
import 'package:weather_app/presentation/weather/weather_states/empty_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/error_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/loading_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/populated_weather.dart';
import 'package:weather_app/presentation/weather/widgets/open_search_button.dart';
import 'package:weather_app/presentation/weather/widgets/open_settings_button.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            OpenSettingsButton(
              onPressed: () => Navigator.of(context).push<void>(
                SettingsPage.route(context.read<WeatherCubit>()),
              ),
            ),
          ],
        ),
        body: Center(
          child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (ctx, state) {
              if (state.status.isSuccess) {
                ctx.read<ThemeCubit>().updateTheme(state.weather);
              }
            },
            builder: (ctx, state) {
              switch (state.status) {
                case WeatherStatus.initial:
                  return const EmptyWeather();
                case WeatherStatus.loading:
                  return const LoadingWeather();
                case WeatherStatus.success:
                  return PopulatedWeather(
                    weather: state.weather,
                    units: state.units,
                    updated: state.lastUpdated ?? DateTime.now(),
                    onRefresh: () async {},
                  );
                case WeatherStatus.failure:
                  return const ErrorWeather();
              }
            },
          ),
        ),
        floatingActionButton: OpenSearchButton(
          onPressed: () async {
            final city = await Navigator.of(context).push(SearchPage.route());
            if (!context.mounted) return;
            await context.read<WeatherCubit>().fetchWeather(city ?? '');
          },
        ),
      );
}
