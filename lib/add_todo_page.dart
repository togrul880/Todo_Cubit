import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  final todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
        backgroundColor: const Color.fromARGB(255, 228, 236, 213),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: todoTitleController,
                decoration:
                    const InputDecoration(hintText: 'What is your next plan?'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<TodoCubit>().addTodo(
                        todoTitleController.text.trim(),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
