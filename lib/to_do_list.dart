import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> tasks = [];
  List<bool> taskCompleted = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do-List"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: taskCompleted[index],
              onChanged: taskCompleted[index] ? null : (value) {
                setState(() {
                  taskCompleted[index] = value ?? false;
                });
              },
            ),
            title: Text(
              tasks[index],
              style: taskCompleted[index]
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : const TextStyle(fontSize: 18),
            ),
            onTap: taskCompleted[index]?null : () {
              _editTask(context, index);
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _deleteTask(context, index);
              },
            ),
            tileColor: Theme.of(context).colorScheme.surface,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTask = '';
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(newTask);
                  taskCompleted.add(false);
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editTask(BuildContext context, int index) {
    String editedTask = tasks[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: TextField(
            controller: TextEditingController(text: editedTask),
            onChanged: (value) {
              editedTask = value;
            },
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  setState(() {
                    tasks[index] = editedTask;
                  });
                  Navigator.pop(context);
                },
                child: Text("Edit")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        );
      },
    );
  }

  void _deleteTask(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Task"),
          content: Text(
            "Are You Sure You Want To Delete This Task From List?",
            style: TextStyle(fontSize: 14.0),
          ),
          icon: Icon(Icons.question_mark, color: Colors.orangeAccent),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text("Yes"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        );
      },
    );
  }
}
