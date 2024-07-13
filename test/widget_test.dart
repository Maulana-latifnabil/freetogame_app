import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freetogame_app/main.dart';

void main() {
  // Tes widget untuk aplikasi
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Membangun aplikasi dan memicu frame
    await tester.pumpWidget(MyApp());

    // Memastikan bahwa counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Menekan ikon '+' dan memicu frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Memastikan bahwa counter telah bertambah
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
