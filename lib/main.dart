import 'package:animation_app/mini_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DragColorApp());

class DragColorApp extends StatelessWidget {
  const DragColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        body: TaskList(),
      ),
    );
  }
}

