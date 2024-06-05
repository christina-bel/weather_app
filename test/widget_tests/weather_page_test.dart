import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domain/bloc/theme/theme_cubit.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/domain/models/location/location.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/domain/models/weather/weather.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/l10n/locale_keys.g.dart';
import 'package:weather_app/presentation/search/search_page.dart';
import 'package:weather_app/presentation/search/widgets/search_button.dart';
import 'package:weather_app/presentation/settings/settings_page.dart';
import 'package:weather_app/presentation/weather/weather_page.dart';
import 'package:weather_app/presentation/weather/weather_states/empty_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/error_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/loading_weather.dart';
import 'package:weather_app/presentation/weather/weather_states/populated_weather.dart';
import 'package:weather_app/presentation/weather/widgets/weather_view.dart';

import '../helpers/hydrated_bloc.dart';

class MockWeatherRepository extends Mock implements IWeatherRepository {}

class MockLocationRepository extends Mock implements ILocationRepository {}

class MockThemeCubit extends MockCubit<Color> implements ThemeCubit {}

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

void main() {
  initHydratedStorage();

  const weather = Weather(
    temperature: 4.2,
    weatherCode: 1,
    location: Location(
      id: 2643743,
      name: 'London',
      latitude: 51.50853,
      longitude: -0.12574,
    ),
  );

  group(
    "WeatherPage",
    () {
      late IWeatherRepository weatherRepo;
      late ILocationRepository locationRepo;

      setUp(() {
        weatherRepo = MockWeatherRepository();
        locationRepo = MockLocationRepository();
      });
      testWidgets('Renders WeatherView', (tester) async {
        await tester.pumpWidget(
          MultiRepositoryProvider(
            providers: [
              RepositoryProvider<IWeatherRepository>(
                  create: (_) => weatherRepo),
              RepositoryProvider<ILocationRepository>(
                  create: (_) => locationRepo),
            ],
            child: const MaterialApp(home: WeatherPage()),
          ),
        );
        expect(find.byType(WeatherView), findsOneWidget);
      });
    },
  );

  group(
    "WeatherView",
    () {
      late ThemeCubit themeCubit;
      late WeatherCubit weatherCubit;

      setUp(() {
        themeCubit = MockThemeCubit();
        weatherCubit = MockWeatherCubit();
      });

      testWidgets('Renders EmptyWeather for WeatherStatus.initial',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(WeatherState.initial());
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        expect(find.byType(EmptyWeather), findsOneWidget);
      });

      testWidgets('Renders LoadingWeather for WeatherStatus.loading',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(
          WeatherState(
            status: WeatherStatus.loading,
            units: TemperatureUnits.celsius,
            weather: Weather.empty(),
          ),
        );
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        expect(find.byType(LoadingWeather), findsOneWidget);
      });

      testWidgets('Renders PopulatedWeather for WeatherStatus.success',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(
          const WeatherState(
            status: WeatherStatus.success,
            weather: weather,
            units: TemperatureUnits.celsius,
          ),
        );
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        expect(find.byType(PopulatedWeather), findsOneWidget);
      });

      testWidgets('Renders ErrorWeather for WeatherStatus.failure',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(
          WeatherState(
            status: WeatherStatus.failure,
            units: TemperatureUnits.celsius,
            weather: Weather.empty(),
          ),
        );
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        expect(find.byType(ErrorWeather), findsOneWidget);
      });

      testWidgets('Navigates to SettingsPage when settings icon is tapped',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(WeatherState.initial());
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        expect(find.byType(SettingsPage), findsOneWidget);
      });

      testWidgets('Navigates to SearchPage when search button is tapped',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(WeatherState.initial());
        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        expect(find.byType(SearchPage), findsOneWidget);
      });

      testWidgets('Calls updateTheme when whether changes', (tester) async {
        whenListen(
          weatherCubit,
          Stream<WeatherState>.fromIterable([
            WeatherState.initial(),
            const WeatherState(
              status: WeatherStatus.success,
              weather: weather,
              units: TemperatureUnits.celsius,
            ),
          ]),
        );
        when(() => weatherCubit.state).thenReturn(
          const WeatherState(
            status: WeatherStatus.success,
            weather: weather,
            units: TemperatureUnits.celsius,
          ),
        );

        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: themeCubit),
              BlocProvider.value(value: weatherCubit),
            ],
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        verify(() => themeCubit.updateTheme(weather)).called(1);
      });

      testWidgets('Triggers refreshWeather on pull to refresh', (tester) async {
        when(() => weatherCubit.state).thenReturn(
          const WeatherState(
            status: WeatherStatus.success,
            weather: weather,
            units: TemperatureUnits.celsius,
          ),
        );
        when(() => weatherCubit.refreshWeather()).thenAnswer((_) async {});

        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );
        await tester.fling(
          find.text('London'),
          const Offset(0, 500),
          1000,
        );
        await tester.pumpAndSettle();
        verify(() => weatherCubit.refreshWeather()).called(1);
      });

      testWidgets('Triggers fetch on search pop', (tester) async {
        const city = 'Chicago';

        when(() => weatherCubit.state).thenReturn(WeatherState.initial());
        when(() => weatherCubit.fetchWeather(any())).thenAnswer((_) async {});

        await tester.pumpWidget(
          BlocProvider.value(
            value: weatherCubit,
            child: const MaterialApp(home: WeatherView()),
          ),
        );

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField), city);
        await tester.tap(find.byKey(SearchButton.buttonKey));
        await tester.pumpAndSettle();
        verify(() => weatherCubit.fetchWeather(city)).called(1);
      });
    },
  );

  group('EmptyWeather', () {
    testWidgets('Renders correct text and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: EmptyWeather(),
          ),
        ),
      );
      expect(find.text(LocaleKeys.emptyWeatherTitle.tr()), findsOneWidget);
      expect(find.text('🏙️'), findsOneWidget);
    });
  });

  group('ErrorWeather', () {
    testWidgets('Renders correct text and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorWeather(),
          ),
        ),
      );
      expect(find.text(LocaleKeys.errorWeatherTitle.tr()), findsOneWidget);
      expect(find.text('🙈'), findsOneWidget);
    });
  });

  group('LoadingWeather', () {
    testWidgets('Renders correct text and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingWeather(),
          ),
        ),
      );
      expect(find.text(LocaleKeys.loadingWeatherTitle.tr()), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('⛅'), findsOneWidget);
    });
  });

  group('PopulatedWeather', () {
    testWidgets('Renders correct emoji (cloudy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PopulatedWeather(
              weather: weather,
              units: TemperatureUnits.celsius,
              onRefresh: () async {},
              updated: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.text('☁️'), findsOneWidget);
    });

    testWidgets('Renders correct emoji (rainy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PopulatedWeather(
              weather: weather.copyWith(weatherCode: 99),
              units: TemperatureUnits.celsius,
              onRefresh: () async {},
              updated: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.text('🌧️'), findsOneWidget);
    });

    testWidgets('Renders correct emoji (clear)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PopulatedWeather(
              weather: weather.copyWith(weatherCode: 0),
              units: TemperatureUnits.celsius,
              onRefresh: () async {},
              updated: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.text('☀️'), findsOneWidget);
    });

    testWidgets('Renders correct emoji (snowy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PopulatedWeather(
              units: TemperatureUnits.celsius,
              onRefresh: () async {},
              weather: weather.copyWith(weatherCode: 71),
              updated: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.text('🌨️'), findsOneWidget);
    });

    testWidgets('Renders correct emoji (unknown)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PopulatedWeather(
              weather: Weather.empty(),
              units: TemperatureUnits.celsius,
              onRefresh: () async {},
              updated: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.text('❓'), findsOneWidget);
    });
  });
}
