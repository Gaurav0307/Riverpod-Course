import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todo.dart';
import 'todo_list_provider.dart';

part 'filtered_todos_provider.g.dart';

@riverpod
List<Todo> filteredTodos(Ref ref, String filter) {
  final todosAsync = ref.watch(todoListProvider);

  final todos = todosAsync.value ?? [];

  final sortedTodos = [...todos]
    ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

  return sortedTodos.where((todo) {
    if (filter == 'completed') {
      return todo.completed;
    } else if (filter == 'pending') {
      return !todo.completed;
    } else {
      return true;
    }
  }).toList();
}
