import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/data/repositories/location_repository_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/weather_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherBlocObserver();
  runApp(
    WeatherApp(
      weatherRepository: WeatherRepositoryImpl(),
      locationRepository: LocationRepositoryImpl(),
    ),
  );
}
