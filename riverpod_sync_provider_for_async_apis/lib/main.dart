import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_sync_provider_for_async_apis/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final preferences = await SharedPreferences.getInstance();

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
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
      title: 'Sync Provider for Async API',
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
