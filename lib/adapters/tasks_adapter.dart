import 'package:flutter/material.dart';

import 'package:variant_app/entities/task.dart';
import 'package:variant_app/entities/enhanced_task.dart';
import './services/database_service.dart';

class TasksAdapter with ChangeNotifier {
  late final DatabaseService _service;
  late List<EnhancedTask> _tasks;

  TasksAdapter() {
    _service = DatabaseService();
  }

  List<EnhancedTask> get tasks => _tasks;

  // Start database connection then render home page
  Future<void> loadDatabase() async {
    await _service.init();
    await _loadTasks();
  }

  Future<void> _loadTasks() async {
    _tasks = await _service.selectTasks();
    notifyListeners();
  }

  // Add task to database then re-render home page
  Future<void> insertTask(Task task) async {
    await _service.insertTask(task);
    _loadTasks();
  }
}
