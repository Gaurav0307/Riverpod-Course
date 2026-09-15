import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/collections.dart';

class CollectionsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final immutableCollection = ImmutableCollection(list: [1, 2, 3]);

    try {
      immutableCollection.list.add(4); // This line will cause a compile-time error because the list is unmodifiable.
    } catch (e) {
      print(e);
    }

    final mutableCollection = MutableCollection(list: [1, 2, 3]);

    try {
      mutableCollection.list.add(4); // This line will not cause a compile-time error because the list is mutable.
    } catch (e) {
      print(e);
    }

    if (kDebugMode) {
      print("Immutable Collection: ${immutableCollection.list}");
      print("Mutable Collection: ${mutableCollection.list}");
    }

    return Scaffold(appBar: AppBar(title: Text('Collections')));
  }
}
