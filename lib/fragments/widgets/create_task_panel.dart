import 'package:flutter/material.dart';
import 'package:variant_app/fragments/widgets/create_task_separator.dart';

import 'package:variant_app/entities/task.dart';
import './elevated_tag.dart';

class CreateTaskPanel extends StatefulWidget {
  final Function onParamChange;

  const CreateTaskPanel({required this.onParamChange});

  @override
  State<CreateTaskPanel> createState() => _CreateTaskPanelState();
}

class _CreateTaskPanelState extends State<CreateTaskPanel> {
  Tag clickedTag = Tag.chore;
  String? body;
  int importancy = 5;
  int urgency = 5;

  List<Widget> generateTagButtons() {
    List<Widget> widgets = [];
    const tags = [
      Tag.chore,
      Tag.conceptiveWork,
      Tag.fun,
      Tag.routineWork,
      Tag.selfCare
    ];

    for (final tag in tags) {
      widgets.add(GestureDetector(
        onTap: () {
          setState(() {
            clickedTag = tag;
            widget.onParamChange("tag", clickedTag);
          });
        },
        child: ElevatedTag(tag: tag, isSelected: clickedTag == tag),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(18),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'New variant',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            minLines: 2,
            maxLines: 4,
            onChanged: (value) => {
              setState(() {
                body = value;
                widget.onParamChange("body", body);
              })
            },
          ),
          const CreateTaskSeparator(name: "Tag"),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 12.0,
            runSpacing: 12.0,
            children: generateTagButtons(),
          ),
          const CreateTaskSeparator(name: "Importancy"),
          Slider(
            value: importancy.toDouble(),
            min: 1,
            max: 10,
            divisions: 10,
            label: importancy.toString(),
            activeColor: Colors.purple[500],
            onChanged: (double value) {
              setState(() {
                importancy = value.round();
                widget.onParamChange("importancy", importancy);
              });
            },
          ),
          const CreateTaskSeparator(name: "Urgency"),
          Slider(
            value: urgency.toDouble(),
            min: 1,
            max: 10,
            divisions: 10,
            label: urgency.toString(),
            activeColor: Colors.orange[500],
            onChanged: (double value) {
              setState(() {
                urgency = value.round();
                widget.onParamChange("urgency", urgency);
              });
            },
          )
        ]),
      ),
    );
  }
}
