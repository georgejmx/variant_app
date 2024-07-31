import 'package:variant_app/entities/task.dart';

List<Task> mockTaskProviders = [
  Task(
    "some random task that has been cropped below a character limit but is not really that small, yeah im just checking that flutter is cropping it properly",
    Tag.selfCare,
    2,
    9,
    DateTime.now().subtract(const Duration(days: 1, hours: 2)),
  ),
  Task(
    "some random small task..",
    Tag.conceptiveWork,
    7,
    3,
    DateTime.now().subtract(const Duration(hours: 6)),
  ),
];
