import 'package:flutter/material.dart';
import 'package:partiel_community/models/task.dart';


class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date d\'échéance: ${task.dueDate.toLocal()}'),
            SizedBox(height: 16.0),
            Text('Statut: ${task.isComplete ? "Complète" : "Incomplète"}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                task.isComplete = !task.isComplete;
                Navigator.pop(context);
              },
              child: Text(task.isComplete ? 'Marquer comme incomplète' : 'Marquer comme complète'),
            ),
          ],
        ),
      ),
    );
  }
}
