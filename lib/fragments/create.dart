import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:variant_app/entities/task.dart';
import 'package:variant_app/adapters/tasks_adapter.dart';
import 'package:variant_app/adapters/navigation_adapter.dart';
import './widgets/create_task_panel.dart';

// ignore: must_be_immutable
class CreateFragment extends StatelessWidget {
  CreateFragment({super.key, required this.tasksAdapter});

  final TasksAdapter tasksAdapter;

  Map<String, dynamic> taskPayload = {
    'body': null,
    'tag': Tag.chore,
    'importancy': 5,
    'urgency': 5,
    'due': DateTime.now()..add(const Duration(days: 7))
  };

  void onParamChange(String paramType, dynamic param) {
    switch (paramType) {
      case "body":
        taskPayload['body'] = param;
      case "tag":
        taskPayload['tag'] = param;
      case "importancy":
        taskPayload['importancy'] = param;
      case "urgency":
        taskPayload['urgency'] = param;
      case "due":
        taskPayload['due'] = param;
    }
  }

  Future<void> createTask() async {
    var task = Task(
      taskPayload['body'] as String,
      taskPayload['tag'] as Tag,
      taskPayload['importancy'] as int,
      taskPayload['urgency'] as int,
      taskPayload['due'] as DateTime,
    );
    await tasksAdapter.insertTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin:
              const EdgeInsets.only(top: 30, bottom: 100, left: 30, right: 30),
          child: Center(
            child: CreateTaskPanel(onParamChange: onParamChange),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (taskPayload['body'] == null) {
            const snackBar =
                SnackBar(content: Text('Please enter a new variant'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }

          await createTask();
          // ignore: use_build_context_synchronously
          Provider.of<NavigationAdapter>(context, listen: false)
              .selectedFragment = AppFragment.home;
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.check),
      ),
    );
  }
}
