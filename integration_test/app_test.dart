import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:quotes_app/app.dart';
import 'package:quotes_app/core/widgets/custom_text_field.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'end-to-end test',
    (tester) async {
      // Load app widget.
      await tester.pumpFrames(const App(), const Duration(seconds: 2));
      // Verify to find "Quotes" app bar title.
      expect(find.text('Quotes'), findsOneWidget);

      // Finds the floating action button to tap on.
      final fab = find.byKey(const Key('add_quote'));
      expect(fab, findsOneWidget);
      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify to find "Create quote".
      expect(find.text('Create quote'), findsOneWidget);

      final textFields = find.byType(CustomTextField);
      expect(textFields, findsNWidgets(2));

      await tester.enterText(textFields.first, 'Test quote');
      await tester.pump();

      await tester.enterText(textFields.last, 'Test Auther');
      await tester.pump();

      // Finds the 'Save Quote' button to tap on.
      final saveButton = find.text('Save Quote');
      expect(saveButton, findsOneWidget);
      // Emulate a tap on the button.
      await tester.tap(saveButton);
      final backButton = find.byType(BackButton);
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);
      await tester.pump(const Duration(seconds: 1));

      final favIcon = find.byIcon(Icons.favorite_border);
      expect(favIcon, findsWidgets);
      for (int i = 0; i < 4; i++) {
        await tester.tap(favIcon.first, warnIfMissed: false);
        await tester.pump(const Duration(milliseconds: 400));
      }
    },
  );
}
