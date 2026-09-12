import 'package:dart_data_class_generator/models/person.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = Person(id: 1, name: 'John', email: 'john@example.com');
    final person2 = person1.copyWith(id: 2, email: 'john2@example.com');
    final person3 = Person(id: 1, name: 'John', email: 'john@example.com');

    if (kDebugMode) {
      print(person1);
      print(person2);
      print(person1 == person3);
      print(person1.hashCode);
      print(person3.hashCode);
    }

    return Scaffold(appBar: AppBar(title: Text('Person')));
  }
}
