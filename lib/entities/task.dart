enum Tag { selfCare, chore, fun, routineWork, conceptiveWork }

enum Priority { importancy, urgency }

class Task {
  final String body;
  final Tag tag;
  final int importancy;
  final int urgency;
  final DateTime? due;

  const Task(this.body, this.tag, this.importancy, this.urgency, this.due);

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'tag': tag.index,
      'importancy': importancy,
      'urgency': urgency,
      'due': due?.microsecondsSinceEpoch
    };
  }
}
