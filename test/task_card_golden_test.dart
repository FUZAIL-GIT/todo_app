import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/dependency_injection.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/presentation/widgets/task_card.dart';

void main() {
  testWidgets('Golden test for TaskCard', (WidgetTester tester) async {
    initializeDependencies();
    loadAppFonts();
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: TaskCard(
              task: TaskEntity(
                id: 'test_id',
                title: 'Test Task Title',
                status: TaskStatus.done,
                createdAt: DateTime.now(),
              ),
            ),
          ),
        ),
      ),
    );

    // Wait for any asynchronous operations or animations to settle
    await tester.pumpAndSettle();

    // Verify the golden file
    await expectLater(
        find.byType(TaskCard), matchesGoldenFile('goldens/task_card.png'));
  });
}
