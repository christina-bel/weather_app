import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/domain/bloc/theme/theme_cubit.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';

class WeatherApp extends StatelessWidget {
  final IWeatherRepository _weatherRepo;
  final ILocationRepository _locationRepo;

  const WeatherApp({
    required IWeatherRepository weatherRepo,
    required ILocationRepository locationRepo,
    super.key,
  })  : _weatherRepo = weatherRepo,
        _locationRepo = locationRepo;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IWeatherRepository>(create: (_) => _weatherRepo),
          RepositoryProvider<ILocationRepository>(create: (_) => _locationRepo),
        ],
        child: BlocProvider(
          create: (_) => ThemeCubit(),
          child: const WeatherAppView(),
        ),
      );
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, Color>(
        builder: (ctx, color) => MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: color,
              primaryContainer: color,
            ),
            textTheme: GoogleFonts.rajdhaniTextTheme(),
          ),
          home: const WeatherPage(),
        ),
      );
}
