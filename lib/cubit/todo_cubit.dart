import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String task) {
    final todo = TodoModel(todoTask: task);
    emit([...state, todo]);
  }

  void removeTodo(index) {
    state.removeAt(index);
    emit([...state]);
  }
}
