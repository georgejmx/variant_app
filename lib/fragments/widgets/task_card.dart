import 'package:flutter/material.dart';
import 'package:variant_app/entities/enhanced_task.dart';

import 'package:variant_app/entities/task.dart';
import './elevated_tag.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final EnhancedTask task;
  final Color timeColour = const Color.fromARGB(255, 223, 146, 146);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 120),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              task.body,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    ElevatedTag(tag: task.tag, isSelected: false),
                    const SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: task.priorityColour(Priority.importancy),
                      child: const Icon(
                        Icons.approval,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: task.priorityColour(Priority.urgency),
                      child: const Icon(
                        Icons.warning_amber,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                task.due != null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: timeColour,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: timeColour,
                              size: 10,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              task.dueStringFromDue(task.due),
                              style: TextStyle(
                                color: timeColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
