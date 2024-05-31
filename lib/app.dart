import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required IWeatherRepository weatherRepository,
    required ILocationRepository locationRepository,
    super.key,
  })  : _weatherRepository = weatherRepository,
        _locationRepository = locationRepository;

  final IWeatherRepository _weatherRepository;
  final ILocationRepository _locationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IWeatherRepository>(
            create: (_) => _weatherRepository),
        RepositoryProvider<ILocationRepository>(
            create: (_) => _locationRepository),
      ],
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const WeatherPage(),
    );
  }
}
