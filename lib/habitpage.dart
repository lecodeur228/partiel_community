import 'package:flutter/material.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
   final List<Habit> _habits = [];

  void _addHabit(String title) {
    setState(() {
      _habits.add(Habit(title: title));
    });
  }

  void _toggleHabitComplete(int index) {
    setState(() {
      _habits[index].isComplete = !_habits[index].isComplete;
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      _habits.removeAt(index);
    });
  }

  void _showAddHabitDialog() {
    String newHabitTitle = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ajouter une Habitude'),
        content: TextField(
          onChanged: (value) {
            newHabitTitle = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (newHabitTitle.isNotEmpty) {
                _addHabit(newHabitTitle);
                Navigator.of(context).pop();
              }
            },
            child: Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: _habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _habits[index].title,
              style: TextStyle(
                decoration: _habits[index].isComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: Checkbox(
              value: _habits[index].isComplete,
              onChanged: (_) {
                _toggleHabitComplete(index);
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteHabit(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabitDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Habit {
  String title;
  bool isComplete;

  Habit({required this.title, this.isComplete = false});
}
