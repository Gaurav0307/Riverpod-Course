import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  Todo({
    required this.id,
    required this.description,
    this.completed = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      description: json['description'],
      completed: json['completed'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  final String id;
  final String description;
  final bool completed;
  final DateTime updatedAt;

  @override
  List<Object> get props => [id, description, completed, updatedAt];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'completed': completed,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
