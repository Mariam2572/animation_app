import 'package:animation_app/animated_list.dart';
import 'package:animation_app/draggable.dart';
import 'package:animation_app/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DragColorApp());

class DragColorApp extends StatelessWidget {
  const DragColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        body: ReorderableExample(),
      ),
    );
  }
}

