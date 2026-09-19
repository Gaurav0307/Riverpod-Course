import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state_notifier_provider/models/todo_model.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});

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
