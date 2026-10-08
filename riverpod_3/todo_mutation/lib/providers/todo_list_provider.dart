import 'dart:convert';

import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';

part 'todo_list_provider.g.dart';

final addTodoMutation = Mutation<void>();
final updateTodoMutation = Mutation<void>();
final deleteTodoMutation = Mutation<void>();

@riverpod
class TodoList extends _$TodoList {
  static const _storageKey = 'todos';
  @override
  FutureOr<List<Todo>> build() async {
    final sp = await SharedPreferences.getInstance();

    final jsonString = sp.getString(_storageKey);

    final todos = jsonString == null
        ? <Todo>[]
        : List<Todo>.from(jsonDecode(jsonString).map((e) => Todo.fromJson(e)));

    await Future.delayed(const Duration(seconds: 2));

    // throw 'Initial loading failed!';

    return todos;
  }

  Future<void> _saveToSP(List<Todo> todos) async {
    final sp = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(todos.map((e) => e.toJson()).toList());

    await sp.setString(_storageKey, jsonString);
  }

  Future<void> addTodo(String description) async {
    await Future.delayed(const Duration(seconds: 2));

    // throw 'Adding Todo failed!';

    final currentTodos = state.value;

    if (currentTodos == null) return;

    final newTodo = Todo(id: const Uuid().v4(), description: description);

    final updatedTodos = [...currentTodos, newTodo];

    state = AsyncData(updatedTodos);

    await _saveToSP(updatedTodos);
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

    await _saveToSP(updatedTodos);
  }

  Future<void> deleteTodo(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    // throw 'Deleting Todo failed!';

    final currentTodos = state.value;

    if (currentTodos == null) return;

    final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();

    state = AsyncData(updatedTodos);

    await _saveToSP(updatedTodos);
  }
}
