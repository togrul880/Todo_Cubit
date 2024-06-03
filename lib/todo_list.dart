import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/todo_cubit.dart';
import 'package:todo_cubit/models/todo_model.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        backgroundColor: const Color.fromARGB(255, 228, 236, 213),
      ),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: ((context, index) {
              final todo = state[index];
              return Container(
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xff6ae792),
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(todo.todoTask),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<TodoCubit>().removeTodo(index);
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add ToDo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
