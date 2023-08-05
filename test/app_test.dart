// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:experience/main.dart';
// import 'package:experience/main.dart' as experience;
import 'package:experience/constants/app_constants.dart';

void main() {
  //  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Flutter Test:', () {
    testWidgets('Check number of buttons.', (WidgetTester tester) async {
      // experience.main();
      // await tester.pumpAndSettle();

      await tester.pumpWidget(const MyExperienceApp());

      await tester.pump(testingShortDuration);

      // Find all the buttons on the page.

      final buttons = find.byType(ElevatedButton);

      // Check the expected number of buttons on the home page.

      expect(buttons, findsNWidgets(4));
    });

    testWidgets('Counter Page.', (WidgetTester tester) async {
      // experience.main();
      // await tester.pumpAndSettle();

      await tester.pumpWidget(const MyExperienceApp());

      // Find the Counter button by its type and text assumed to be the
      // third button. Perhaps better to find it by key?

      final button = find.byType(ElevatedButton).at(2);
      final text = find.text('Counter');

      // Expect the button and text to be on the screen. There is a second Text
      // widget in the navigation bar.

      expect(button, findsOneWidget);
      expect(text, findsNWidgets(2));

      // Tap the button

      await tester.tap(button);

      await tester.pump(testingShortDuration);

      // Verify that our counter starts at 0.

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      await tester.pump(testingShortDuration);

      // Tap the '+' icon 4 more times.

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.

      expect(find.text('0'), findsNothing);
      expect(find.text('5'), findsOneWidget);

      await tester.pump(testingShortDuration);

      // TODO Click the back arrow button to return home.
    });
    // TODO Click the nav bar button to go to the Counter page

    // TODO Click the nav bar button to go to the Text then Image then Home
    // pages.
  });
}
