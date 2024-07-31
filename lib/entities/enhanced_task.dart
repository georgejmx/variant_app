import 'package:flutter/material.dart';

import 'package:variant_app/entities/task.dart';

mixin TaskEnhancer on Task {
  Color? priorityColour(Priority priorityType) {
    if (priorityType == Priority.importancy) {
      return Colors.purple[importancy * 100];
    }
    return Colors.orange[urgency * 100];
  }

  String? get dueString {
    if (due == null) {
      return null;
    }

    var now = DateTime.now();
    if (now.isAfter(due!)) {
      return 'Overdue';
    }

    if (due!.isAfter(now.add(const Duration(days: 1)))) {
      return 'Less than a day';
    }

    if (due!.isAfter(now.add(const Duration(days: 3)))) {
      return 'Less than 3 days';
    }

    if (due!.isAfter(now.add(const Duration(days: 7)))) {
      return 'Less than a week';
    }
    return 'More than a week';
  }
}

class EnhancedTask extends Task with TaskEnhancer {
  EnhancedTask(
    super.body,
    super.tag,
    super.importancy,
    super.urgency,
    super.due,
  );
}
