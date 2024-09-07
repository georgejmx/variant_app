import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:variant_app/entities/task.dart';
import 'package:variant_app/fragments/widgets/create_task_panel.dart';
import '../support/mock_app_wrapper.dart';

const mockBody = "Unit tests are a future investment";

void onParamChange(String paramType, dynamic newParam) {
  if (paramType == "body") {
    expect(newParam, mockBody);
  } else {
    expect(newParam, Tag.routineWork);
  }
}

void main() {
  testWidgets("CreateTaskPanel creates tasks", (tester) async {
    await tester
        // ignore: prefer_const_constructors
        .pumpWidget(mockAppWith(CreateTaskPanel(onParamChange: onParamChange)));

    expect(find.text("chore"), findsOneWidget);
    expect(find.text("engaging work"), findsOneWidget);

    await tester.enterText(find.byType(TextField), mockBody);
    expect(find.text(mockBody), findsOneWidget);

    await tester.tap(find.text("routine work"));
    await tester.pump();
  });
}
