// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  String id;
  String desc;
  bool completed;

  Todo({required this.id, required this.desc, this.completed = false});

  factory Todo.add({required String description}) {
    return Todo(id: uuid.v4(), desc: description, completed: false);
  }

  @override
  String toString() {
    return "{id: $id, desc: $desc, completed: $completed}";
  }
}
