import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app.dart';

void main() {
  testWidgets('Golden test', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());
    await expectLater(find.byType(TodoApp), matchesGoldenFile('main.png'));
  });
}
