import 'package:flutter/material.dart';

class CreateTaskSeparator extends StatelessWidget {
  const CreateTaskSeparator({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 14),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
