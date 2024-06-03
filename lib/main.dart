import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/data/repositories/location_repository_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/weather_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(
    WeatherApp(
      weatherRepo: WeatherRepositoryImpl(),
      locationRepo: LocationRepositoryImpl(),
    ),
  );
}
