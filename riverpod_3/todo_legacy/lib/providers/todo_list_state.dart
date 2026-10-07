// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../models/todo.dart';

enum TodoListStatus {
  loaded,
  adding,
  added,
  addFailure,
  updating,
  updated,
  updateFailure,
  deleted,
  deleteFailure,
}

class TodoListState extends Equatable {
  const TodoListState({
    this.status = TodoListStatus.loaded,
    this.todos = const [],
    this.transientFailure,
    this.deletingTodoId,
  });

  final TodoListStatus status;
  final List<Todo> todos;
  final String? transientFailure;
  final String? deletingTodoId;

  @override
  List<Object> get props => [
    status,
    todos,
    transientFailure ?? '',
    deletingTodoId ?? '',
  ];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    TodoListStatus? status,
    List<Todo>? todos,
    String? Function()? transientFailure,
    String? Function()? deletingTodoId,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      transientFailure: transientFailure != null
          ? transientFailure()
          : this.transientFailure,
      deletingTodoId: deletingTodoId != null
          ? deletingTodoId()
          : this.deletingTodoId,
    );
  }
}
