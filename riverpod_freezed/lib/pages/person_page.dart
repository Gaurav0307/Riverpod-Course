import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/person.dart';

class PersonPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = Person(id: 1, name: 'John Doe', email: "john@example.com");
    final person2 = Person(id: 1, name: 'John Doe', email: "john@example.com");
    final person3 = person1.copyWith(id: 2, email: "johndoe@example.com");

    // Since person1 is immutable
    // person1.id = 3; // not allowed
    // person1.name = "John Doe"; // not allowed
    // person1.email = "johndoe@example.com"; // not allowed

    if (kDebugMode) {
      print(person1);
      print(person1 == person2);
      print(person3);
    }

    return Scaffold(appBar: AppBar(title: Text('Person')));
  }
}
