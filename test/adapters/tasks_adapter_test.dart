import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:variant_app/adapters/services/database_service.dart';
import 'package:variant_app/adapters/tasks_adapter.dart';

import 'tasks_adapter_test.mocks.dart';
import '../support/tasks_fixture.dart';

@GenerateMocks([DatabaseService])
void main() {
  group('TasksAdapter', () {
    test("correctly loads data from the database", () async {
      final service = MockDatabaseService();

      when(service.selectTasks()).thenAnswer((_) async => mockEnhancedTasks);

      final adapter = TasksAdapter(service);
      await adapter.loadDatabase();

      expect(adapter.tasks.length, 2);
      expect(adapter.tasks[0].body, mockEnhancedTasks[0].body);
    });

    test("correctly initialises new enhanced tasks", () async {
      final service = MockDatabaseService();

      when(service.selectTasks()).thenAnswer((_) async => mockEnhancedTasks);

      final adapter = TasksAdapter(service);
      await adapter.loadDatabase();
      expect(adapter.tasks.length, 2);

      await adapter.insertTask(mockNewTask);

      mockEnhancedTasks.add(mockNewTask);

      when(service.selectTasks()).thenAnswer((_) async => mockEnhancedTasks);

      expect(adapter.tasks.length, 3);
      expect(adapter.tasks[2].dueString, "Less than a day");
    });
  });
}
