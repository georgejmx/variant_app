import 'package:flutter/material.dart';

import 'package:variant_app/entities/task.dart';

class EisenhowerRating extends StatelessWidget {
  const EisenhowerRating(
      {super.key, required this.priority, required this.rating});

  final Priority priority;
  final int rating;

  // Parse a valid material colour from the integer rating and priority type
  Color? priorityColour(Priority priority, int rating) {
    var colourIntensity = rating == 1 ? 50 : (rating - 1) * 100;
    if (priority == Priority.importancy) {
      return Colors.purple[colourIntensity];
    }
    return Colors.orange[colourIntensity];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
              priority == Priority.importancy
                  ? Icons.approval
                  : Icons.warning_amber,
              color: priorityColour(priority, rating),
              size: 15),
          CircularProgressIndicator(
            value: rating / 10,
            semanticsLabel: '$priority progress indicator',
            color: priorityColour(priority, rating),
            strokeWidth: 2,
          )
        ],
      ),
    );
  }
}
