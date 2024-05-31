import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/theme/theme_cubit.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/search/search_page.dart';
import 'package:weather_app/presentation/weather/widgets/weather_states/empty_weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_states/error_weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_states/loading_weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_states/populated_weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              /*Navigator.of(context).push<void>(
                SettingsPage.route(context.read<WeatherCubit>()),
              );*/
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (ctx, state) {
            if (state is CurrentWeather) {
              ctx.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (ctt, state) => state.when(
            initial: () => const EmptyWeather(),
            loading: () => const LoadingWeather(),
            success: (weather, lastUpdated, _) => PopulatedWeather(
              weather: weather,
              lastUpdated: lastUpdated,
              onRefresh: () async {},
            ),
            failure: (mess) => const ErrorWeather(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());
          if (!context.mounted) return;
          await context.read<WeatherCubit>().fetchWeather(city ?? '');
        },
      ),
    );
  }
}
