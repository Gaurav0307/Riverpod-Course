import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_change_notifier_provider/models/todo_model.dart';
import 'package:flutter/foundation.dart';

final todoProvider = ChangeNotifierProvider<TodoNotifier>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends ChangeNotifier {
  List<Todo> todos = [];

  void add({required String desc}) {
    todos.add(Todo.add(description: desc));

    notifyListeners();
  }

  void toggleCompleted({required String id}) {
    // Method-1
    // for (final todo in todos) {
    //   if (todo.id == id) todo.completed = !todo.completed;
    // }

    // Method-2
    final todo = todos.firstWhere((todo) => todo.id == id);

    todo.completed = !todo.completed;

    notifyListeners();
  }

  void delete({required String id}) {
    todos.removeWhere((todo) => todo.id == id);

    notifyListeners();
  }
}

/*
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add({required String desc}) {
    state = [...state, Todo.add(description: desc)];
  }

  void toggleCompleted({required String id}) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void delete({required String id}) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }
}
*/
