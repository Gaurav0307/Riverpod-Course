import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'todo_list_provider.dart';

part 'completed_count_provider.g.dart';

@riverpod
int completedCount(Ref ref) {
  final todos = ref.watch(todoListProvider).value ?? [];

  final completedTodos = todos.where((todo) => todo.completed).toList();

  return completedTodos.length;
}