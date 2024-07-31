import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:variant_app/adapters/navigation_adapter.dart';
import 'package:variant_app/adapters/tasks_adapter.dart';
import './widgets/task_card.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key, required this.tasksAdapter});

  final TasksAdapter tasksAdapter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: tasksAdapter,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            body: Container(
              margin: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('this is where the charts will go'),
                    const SizedBox(height: 30),
                    Flexible(
                        child: ListView.builder(
                            itemCount: tasksAdapter.tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              final selectedTask = tasksAdapter.tasks[index];

                              return TaskCard(task: selectedTask);
                            }))
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<NavigationAdapter>(context, listen: false)
                    .selectedFragment = AppFragment.create;
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.create),
            ),
          );
        });
  }
}
