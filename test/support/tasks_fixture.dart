import 'package:variant_app/entities/enhanced_task.dart';
import 'package:variant_app/entities/task.dart';

List<EnhancedTask> mockEnhancedTasks = [
  EnhancedTask(
    "some random small task..",
    Tag.selfCare,
    2,
    9,
    null,
  ),
  EnhancedTask(
    "some random task that has been cropped below a character limit but is not really that small, yeah im just checking that flutter is cropping it properly",
    Tag.conceptiveWork,
    7,
    3,
    DateTime.now().add(const Duration(days: 1, hours: 2)),
  ),
];
