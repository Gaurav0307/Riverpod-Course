import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/mutable_person.dart';

class MutablePersonPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = MutablePerson(
      id: 1,
      name: 'John Doe',
      email: "john@example.com",
    );
    final person2 = MutablePerson(
      id: 1,
      name: 'John Doe',
      email: "john@example.com",
    );
    final person3 = person1.copyWith(id: 2, email: "johndoe@example.com");

    // Since person1 is mutable
    person1.id = 3; // allowed
    person1.name = "John Doe"; // allowed
    person1.email = "johndoe@example.com"; // allowed

    if (kDebugMode) {
      print(person1);
      print(person1 == person2);
      print(person3);
    }

    return Scaffold(appBar: AppBar(title: Text('Mutable Person')));
  }
}
