import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/method.dart';

class MethodPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final method1 = Method("Method-1", version: 1.0);
    method1.printMethod();

    final method2 = Method("Method-2", version: 1.5);
    method2.printMethod();

    return Scaffold(appBar: AppBar(title: Text('Method')));
  }
}
