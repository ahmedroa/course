import 'package:flutter/material.dart';

class newTasksScreen extends StatelessWidget {
  const newTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New Tasks',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
