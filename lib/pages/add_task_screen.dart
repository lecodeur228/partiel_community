import 'package:flutter/material.dart';
import 'package:partiel_community/models/task.dart';


class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une Tâche'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titre de la tâche'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                setState(() {
                  _selectedDate = selectedDate;
                });
              },
              child: Text(_selectedDate == null ? 'Sélectionner la date d\'échéance' : 'Date: $_selectedDate'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty && _selectedDate != null) {
                  final newTask = Task(
                    title: _titleController.text,
                    dueDate: _selectedDate!,
                  );
                  Navigator.pop(context, newTask);
                }
              },
              child: Text('Ajouter la Tâche'),
            ),
          ],
        ),
      ),
    );
  }
}
