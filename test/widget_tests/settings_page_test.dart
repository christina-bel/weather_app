import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domain/bloc/weather/weather_cubit.dart';
import 'package:weather_app/domain/models/temperature/temperature_units.dart';
import 'package:weather_app/presentation/settings/settings_page.dart';

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

void main() {
  group('SettingsPage', () {
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherCubit = MockWeatherCubit();
    });

    testWidgets('Is routable', (tester) async {
      when(() => weatherCubit.state).thenReturn(WeatherState.initial());

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.of(ctx).push<void>(
                  SettingsPage.route(weatherCubit),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('Calls toggleUnits when switch is changed', (tester) async {
      whenListen(
        weatherCubit,
        Stream.fromIterable([
          WeatherState.initial(),
          WeatherState.initial().copyWith(units: TemperatureUnits.fahrenheit),
        ]),
      );
      when(() => weatherCubit.state).thenReturn(WeatherState.initial());
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.of(ctx).push<void>(
                  SettingsPage.route(weatherCubit),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Switch));
      verify(() => weatherCubit.toggleUnits()).called(1);
    });
  });
}
