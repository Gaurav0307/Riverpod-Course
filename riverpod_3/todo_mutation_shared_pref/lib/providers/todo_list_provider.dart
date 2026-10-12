import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';
import 'storage_provider.dart';

part 'todo_list_provider.g.dart';

final addTodoMutation = Mutation<void>();
final updateTodoMutation = Mutation<void>();
final deleteTodoMutation = Mutation<void>();

@riverpod
@JsonPersist()
class TodoList extends _$TodoList {
  static const _storageKey = 'todos';
  @override
  FutureOr<List<Todo>> build() async {
    persist(
      ref.watch(storageProvider.future),
      key: _storageKey,
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    );

    await Future.delayed(const Duration(seconds: 3));

    // throw 'Initial loading failed!';

    return state.value ?? [];
  }

  Future<void> addTodo(String description) async {
    await Future.delayed(const Duration(seconds: 2));

    // throw 'Adding Todo failed!';

    final currentTodos = state.value;

    if (currentTodos == null) return;

    final newTodo = Todo(id: const Uuid().v4(), description: description);

    final updatedTodos = [...currentTodos, newTodo];

    state = AsyncData(updatedTodos);
  }

  Future<void> updateTodo(String id, String description, bool completed) async {
    await Future.delayed(const Duration(seconds: 2));

    // throw 'Updating Todo failed!';

    final currentTodos = state.value;

    if (currentTodos == null) return;

    final updatedTodos = currentTodos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          description: description,
          completed: completed,
          updatedAt: DateTime.now(),
        );
      }

      return todo;
    }).toList();

    state = AsyncData(updatedTodos);
  }

  Future<void> deleteTodo(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    // throw 'Deleting Todo failed!';

    final currentTodos = state.value;

    if (currentTodos == null) return;

    final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();

    state = AsyncData(updatedTodos);
  }
}
