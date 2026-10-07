import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';
import 'todo_list_state.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  static const _storageKey = 'todos';
  @override
  FutureOr<TodoListState> build() async {
    final sp = await SharedPreferences.getInstance();

    final jsonString = sp.getString(_storageKey);

    final todos = jsonString == null
        ? <Todo>[]
        : List<Todo>.from(jsonDecode(jsonString).map((e) => Todo.fromJson(e)));

    await Future.delayed(const Duration(seconds: 1));

    // throw 'Initial loading failed!';

    return TodoListState(todos: todos);
  }

  Future<void> _saveToSP(List<Todo> todos) async {
    final sp = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(todos.map((e) => e.toJson()).toList());

    await sp.setString(_storageKey, jsonString);
  }

  Future<void> addTodo(String description) async {
    final initialModel = state.value;

    if (initialModel == null) return;

    state = AsyncData(initialModel.copyWith(status: TodoListStatus.adding));

    try {
      await Future.delayed(const Duration(seconds: 1));

      // throw 'Adding Todo failed!';

      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      final newTodo = Todo(id: const Uuid().v4(), description: description);

      final updatedTodos = [...currentModel.todos, newTodo];

      state = AsyncData(
        currentModel.copyWith(
          status: TodoListStatus.added,
          todos: updatedTodos,
        ),
      );

      await _saveToSP(updatedTodos);
    } catch (e) {
      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      state = AsyncData(
        initialModel.copyWith(
          status: TodoListStatus.addFailure,
          transientFailure: () => e.toString(),
        ),
      );
    }
  }

  Future<void> updateTodo(String id, String description, bool completed) async {
    final initialModel = state.value;

    if (initialModel == null) return;

    state = AsyncData(initialModel.copyWith(status: TodoListStatus.updating));

    try {
      await Future.delayed(const Duration(seconds: 1));

      // throw 'Updating Todo failed!';

      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      final updatedTodos = currentModel.todos.map((todo) {
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

      state = AsyncData(
        currentModel.copyWith(
          status: TodoListStatus.updated,
          todos: updatedTodos,
        ),
      );

      await _saveToSP(updatedTodos);
    } catch (e) {
      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      state = AsyncData(
        initialModel.copyWith(
          status: TodoListStatus.updateFailure,
          transientFailure: () => e.toString(),
        ),
      );
    }
  }

  Future<void> deleteTodo(String id) async {
    final initialModel = state.value;

    if (initialModel == null) return;

    state = AsyncData(initialModel.copyWith(deletingTodoId: () => id));

    try {
      await Future.delayed(const Duration(seconds: 1));

      // throw 'Deleting Todo failed!';

      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      final updatedTodos = currentModel.todos
          .where((todo) => todo.id != id)
          .toList();

      state = AsyncData(
        currentModel.copyWith(
          status: TodoListStatus.deleted,
          todos: updatedTodos,
          deletingTodoId: () => null,
        ),
      );

      await _saveToSP(updatedTodos);
    } catch (e) {
      if (!ref.mounted) return;

      final currentModel = state.value;

      if (currentModel == null) return;

      state = AsyncData(
        initialModel.copyWith(
          status: TodoListStatus.deleteFailure,
          transientFailure: () => e.toString(),
          deletingTodoId: () => null,
        ),
      );
    }
  }

  void clearTransientFailure() {
    final currentModel = state.value;

    if (currentModel != null && currentModel.transientFailure != null) {
      state = AsyncData(
        currentModel.copyWith(
          status: TodoListStatus.loaded,
          transientFailure: () => null,
        ),
      );
    }
  }

  void clearStatus() {
    final currentModel = state.value;

    if (currentModel != null) {
      state = AsyncData(
        currentModel.copyWith(
          status: TodoListStatus.loaded,
          transientFailure: () => null,
        ),
      );
    }
  }
}
