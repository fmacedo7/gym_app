import 'package:flutter_test/flutter_test.dart';

import 'package:gym_app/main.dart';

void main() {
  testWidgets('Home Page Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Home Page is displayed.
    expect(find.text('Hi, Julia!'), findsOneWidget);
    expect(find.text('Schedule'), findsOneWidget);
  });
}