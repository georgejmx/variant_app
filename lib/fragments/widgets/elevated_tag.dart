import 'package:flutter/material.dart';

import 'package:variant_app/entities/task.dart';

class ElevatedTag extends StatelessWidget {
  const ElevatedTag({
    super.key,
    required this.tag,
    required this.isSelected,
  });

  final selectedColour = const Color.fromARGB(255, 103, 194, 108);

  final Tag tag;
  final bool isSelected;

  String tagNames(Tag tag) {
    switch (tag) {
      case Tag.selfCare:
        return 'self-care';
      case Tag.chore:
        return 'chore';
      case Tag.fun:
        return 'fun';
      case Tag.routineWork:
        return 'routine work';
      case Tag.conceptiveWork:
        return 'engaging work';
      default:
        return 'unknown';
    }
  }

  Color tagColours(Tag tag) {
    switch (tag) {
      case Tag.selfCare:
        return Colors.yellow;
      case Tag.chore:
        return Colors.cyanAccent;
      case Tag.fun:
        return const Color.fromARGB(255, 216, 100, 92);
      case Tag.routineWork:
        return const Color.fromARGB(255, 10, 85, 146);
      case Tag.conceptiveWork:
        return const Color.fromARGB(255, 236, 32, 17);
      default:
        return Colors.brown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: tagColours(tag),
          borderRadius: BorderRadius.circular(16.0),
          border: isSelected
              ? Border.all(
                  width: 2,
                  color: selectedColour,
                )
              : null),
      child: Text(
        tagNames(tag),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
