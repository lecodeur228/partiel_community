import 'package:flutter/material.dart';
import 'package:partiel_community/models/task.dart';


class EditTaskScreen extends StatefulWidget {
  final Task task;

  EditTaskScreen({required this.task});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _selectedDate = widget.task.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Éditer la Tâche'),
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
                  initialDate: _selectedDate ?? DateTime.now(),
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
                  setState(() {
                    widget.task.title = _titleController.text;
                    widget.task.dueDate = _selectedDate!;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Mettre à jour la Tâche'),
            ),
          ],
        ),
      ),
    );
  }
}
