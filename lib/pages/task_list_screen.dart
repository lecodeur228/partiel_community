import 'package:flutter/material.dart';
import 'package:partiel_community/models/task.dart';
import 'package:partiel_community/pages/detail_task_screen.dart';

import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> tasks = [];

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _toggleTaskComplete(Task task) {
    setState(() {
      task.isComplete = !task.isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de Tâches'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
              if (newTask != null) {
                _addTask(newTask);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('Date d\'échéance: ${task.dueDate.toLocal()}'),
            trailing: Checkbox(
              value: task.isComplete,
              onChanged: (bool? value) {
                _toggleTaskComplete(task);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
