import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:variant_app/entities/task.dart';
import 'package:variant_app/entities/enhanced_task.dart';

class DatabaseService {
  late Future<Database> db;

  Future<void> init() async {
    db = openDatabase(join(await getDatabasesPath(), 'variant_db.db'),
        onCreate: (db, version) {
      return db.execute('''CREATE TABLE IF NOT EXISTS task(
            _id INTEGER PRIMARY KEY AUTOINCREMENT,
            body text NOT NULL,
            tag INTEGER NOT NULL,
            importancy INTEGER NOT NULL,
            urgency INTEGER NOT NULL,
            due INTEGER
          )''');
    }, version: 1);
  }

  Future<void> insertTask(Task task) async {
    final dbInstance = await db;

    await dbInstance.insert(
      'task',
      task.toDatabaseInput(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  DateTime? _getDue(dynamic dbValue) {
    if (dbValue == null || dbValue is! int) {
      return null;
    }
    return DateTime.fromMicrosecondsSinceEpoch(dbValue);
  }

  Future<List<EnhancedTask>> selectTasks() async {
    final dbInstance = await db;

    final List<Map<String, dynamic>> taskMaps = await dbInstance.query('task');
    List<EnhancedTask> tasks = [];

    for (final taskMap in taskMaps) {
      tasks.add(
        EnhancedTask(
          taskMap['body'] as String,
          Tag.values[taskMap['tag'] as int],
          taskMap['importancy'] as int,
          taskMap['urgency'] as int,
          _getDue(taskMap['due']),
        ),
      );
    }
    return tasks;
  }
}
