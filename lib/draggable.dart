import 'package:flutter/material.dart';

class DragColorExample extends StatefulWidget {
  const DragColorExample({super.key});

  @override
  State<DragColorExample> createState() => _DragColorExampleState();
}

class _DragColorExampleState extends State<DragColorExample> {
  final Map<Color, bool> accepted = {
    Colors.red: false,
    Colors.green: false,
    Colors.blue: false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: accepted.keys.map((color) {
            return Draggable<Color>(
              data: color,
              feedback: CircleAvatar(radius: 30, backgroundColor: color),
              childWhenDragging: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              child: CircleAvatar(radius: 30, backgroundColor: color),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: accepted.keys.map((color) {
            return DragTarget<Color>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: accepted[color]! ? color : Colors.grey[300],
                    border: Border.all(color: color, width: 3),
                  ),
                  child: Center(
                    child: accepted[color]!
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              },
              onWillAcceptWithDetails: (data) => data.data == color,
              onAcceptWithDetails: (data) {
                setState(() {
                  accepted[color] = true;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
