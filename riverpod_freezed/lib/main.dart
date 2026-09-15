import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:riverpod_freezed/pages/collections_page.dart';
import 'package:riverpod_freezed/pages/method.dart';
import 'package:riverpod_freezed/pages/mutable_person_page.dart';
import 'package:riverpod_freezed/pages/person_page.dart';
import 'package:riverpod_freezed/widgets/custom_button.dart';

void main() {
  runApp(
    DevicePreview(enabled: kDebugMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Freezed',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.indigo.shade400,
          foregroundColor: Colors.white,
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Freezed Data Class')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            CustomButton(title: 'Person', child: PersonPage()),
            CustomButton(title: "Mutable Person", child: MutablePersonPage()),
            CustomButton(title: "Collections", child: CollectionsPage()),
            CustomButton(title: "Method", child: MethodPage()),
          ],
        ),
      ),
    );
  }
}
