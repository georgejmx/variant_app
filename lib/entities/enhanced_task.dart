import 'package:flutter/material.dart';

import 'package:variant_app/entities/task.dart';

mixin TaskEnhancer on Task {
  Color? priorityColour(Priority priorityType) {
    if (priorityType == Priority.importancy) {
      return Colors.purple[importancy * 100];
    }
    return Colors.orange[urgency * 100];
  }

  String dueStringFromDue(DateTime? due) {
    if (due == null) {
      return '';
    }
    var now = DateTime.now();
    var daysRemaining = now.difference(due).inDays;
    if (daysRemaining < 0) {
      return 'Overdue';
    } else if (daysRemaining == 0) {
      var hoursRemaining = now.difference(due).inHours;
      if (hoursRemaining <= 1) {
        return '1 hour';
      }
      return '$hoursRemaining hours';
    }

    if (daysRemaining == 1) {
      return '1 day';
    }
    return '$daysRemaining days';
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
