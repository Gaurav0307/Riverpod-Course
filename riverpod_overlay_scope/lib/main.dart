import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_overlay_scope/providers/counter_provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => ProviderScope(
        // retry: (_, __) => null, // Disables automatic retries globally if exception is thrown.
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Scope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade400,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProviderScope(
                    overrides: [
                      counterProvider.overrideWith(() => Counter100()),
                    ],
                    child: const HomePage(),
                  );
                },
              ),
            );
          },
          child: const Text('Home', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
