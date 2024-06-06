import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/search/search_page.dart';
import 'package:weather_app/presentation/search/widgets/search_button.dart';

void main() {
  const expectedLocation = 'Chicago';

  group('SearchPage', () {
    testWidgets('Is routable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.of(ctx).push(SearchPage.route()),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsOneWidget);
    });

    testWidgets('Returns selected text when popped', (tester) async {
      String? actualLocation;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async => actualLocation =
                    await Navigator.of(ctx).push(SearchPage.route()),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), expectedLocation);
      await tester.tap(find.byKey(SearchButton.buttonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsNothing);
      expect(actualLocation, expectedLocation);
    });
  });
}
