import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/data/repositories/location_repository_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/bloc/weather_bloc_observer.dart';
import 'package:weather_app/domain/untils/localization_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(
    EasyLocalizationHelper.wrap(
      WeatherApp(
        weatherRepo: WeatherRepositoryImpl(),
        locationRepo: LocationRepositoryImpl(),
      ),
    ),
  );
}
