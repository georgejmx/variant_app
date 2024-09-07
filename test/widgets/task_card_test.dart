import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:variant_app/fragments/widgets/task_card.dart';
import '../support/mock_app_wrapper.dart';
import '../support/tasks_fixture.dart';

void main() {
  testWidgets("TaskCard displays required data", (tester) async {
    await tester.pumpWidget(mockAppWith(TaskCard(task: mockEnhancedTasks[0])));

    expect(find.text("some random small task.."), findsOneWidget);
    expect(find.text("self-care"), findsOneWidget);

    final importancyFinder = find.byIcon(Icons.approval);
    expect(importancyFinder, findsOneWidget);

    final urgencyFinder = find.byIcon(Icons.warning_amber);
    expect(urgencyFinder, findsOneWidget);

    expect(find.text("Overdue"), findsNothing);
  });

  testWidgets("TaskCard displays the correct due", (tester) async {
    await tester.pumpWidget(mockAppWith(TaskCard(task: mockEnhancedTasks[1])));

    final dueFinder = find.text("Less than 3 days");
    expect(dueFinder, findsOneWidget);
  });
}
