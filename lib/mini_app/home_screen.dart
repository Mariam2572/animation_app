import 'package:animation_app/mini_app/task_model.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  final List<Task> tasks = const [
    Task(
      title: "Build Login Screen",
      description: "Create a login screen with validation.",
      steps: ["Design UI", "Add Validation", "Connect Backend"],
      tags: ["UI", "Forms", "Auth"],
    ),
    Task(
      title: "Profile Page",
      description: "Show user info and settings.",
      steps: ["Add Avatar", "Display Info", "Edit Options"],
      tags: ["Profile", "User", "Settings"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks.map((task) => TaskTile(task: task)).toList(),
    );
  }
}

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.task.title),
      subtitle: Text(widget.task.description),
      children: [
        Stepper(
          currentStep: currentStep,
          steps: widget.task.steps
              .map(
                (step) =>
                    Step(title: Text(step), content: const SizedBox.shrink()),
              )
              .toList(),
          onStepTapped: (index) {
            currentStep = index;
            setState(() {});
          },
          onStepCancel: () {
            if (currentStep > 0) {
              currentStep--;
              setState(() {});
            }
          },
          
          onStepContinue: () {
            if (currentStep != widget.task.steps.length - 1) {
              currentStep++;
              setState(() {});
            }
          },
        ),
        Wrap(
          spacing: 8,
          children: widget.task.tags
              .map(
                (tag) => Chip(
                  label: Text(tag),
                  avatar: const Icon(Icons.label, size: 16),
                ),
              )
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}
