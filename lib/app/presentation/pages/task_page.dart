// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_clean_arch/app/core/entities/task_entitie.dart';
import 'package:task_clean_arch/app/presentation/widgets/custom_textfield.dart';

import '../controllers/task_controller.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _controller = TaskController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.fetchTasks();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addTask() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      _controller.addTask(TaskEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        description: description,
      ));

      _titleController.clear();
      _descriptionController.clear();
    }
  }

  void _removeTask(int id) {
    _controller.removeTask(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Observer(
        builder: (_) {
          if (_controller.tasks.isEmpty) {
            return Center(
              child: Text('No tasks yet!'),
            );
          } else {
            return ListView.builder(
              itemCount: _controller.tasks.length,
              itemBuilder: (context, index) {
                final task = _controller.tasks[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text('Title: ${task.title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description: ${task.description}'),
                        Text('Identifier: ${task.id}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => _removeTask(task.id),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Align(
                    alignment: Alignment.center,
                    child: Text('Create a new task'),
                  ),
                  content: Container(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                            hint: 'Title',
                            onChanged: (value) {
                              _titleController.text = value;
                            }),
                        const SizedBox(height: 10),
                        CustomTextField(
                            hint: 'Description',
                            onChanged: (value) {
                              _descriptionController.text = value;
                            }),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _addTask();
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.check),
                            label: Text('Save'),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
