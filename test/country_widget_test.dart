import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touristapp/screens/TasteTrialStylePage.dart';

void main() {
  testWidgets('Tap on Turkey', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TasteTrialStylePage()));

    final turkeyFinder = find.text('Turkey');
    expect(turkeyFinder, findsOneWidget);

    await tester.tap(turkeyFinder);
    await tester.pumpAndSettle();
  });

  testWidgets('Tap on Istanbul', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TasteTrialStylePage()));

    await tester.tap(find.text('Turkey'));
    await tester.pumpAndSettle();

    final istanbulFinder = find.text('Istanbul');
    expect(istanbulFinder, findsWidgets);

    await tester.tap(istanbulFinder.first);
    await tester.pumpAndSettle();
  });

  testWidgets('Dish cards appear after selecting Istanbul', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TasteTrialStylePage()));

    await tester.tap(find.text('Turkey'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Istanbul'));
    await tester.pumpAndSettle();

    expect(find.text('Menemen'), findsWidgets);
  });

  testWidgets('Tapping on Menemen navigates to detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TasteTrialStylePage()));

    await tester.tap(find.text('Turkey'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Istanbul'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Menemen'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Menemen'), findsWidgets);
  });

  testWidgets('Dish image shows up on detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TasteTrialStylePage()));

    await tester.tap(find.text('Turkey'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Istanbul'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Menemen'));
    await tester.pumpAndSettle();

    expect(
      find.byType(Image),
      findsWidgets,
    ); // Assumes at least one image exists
  });
}
