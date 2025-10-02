class Task {
  final String title;
  final String description;
  final List<String> steps;
  final List<String> tags;

  const Task({
    required this.title,
    required this.description,
    required this.steps,
    required this.tags,
  });
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json["title"],
      description: json["description"],
      steps: List<String>.from(json["steps"]),
      tags: List<String>.from(json["tags"]),
    );
  }
}
