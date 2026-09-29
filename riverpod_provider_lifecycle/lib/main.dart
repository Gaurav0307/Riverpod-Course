import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_provider_lifecycle/pages/async_keep_alive/products_page.dart';

import 'pages/auto_dispose/auto_dispose_page.dart';
import 'pages/keep_alive/keep_alive_page.dart';
import 'pages/provider_cascade/provider_cascade_page.dart';
import 'pages/sync_keep_alive/sync_keep_alive_page.dart';
import 'widgets/custom_button.dart';

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
      title: 'Provider Lifecycle',
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
      appBar: AppBar(
        title: const Text('Provider Lifecycle'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: const [
            CustomButton(
              title: 'AutoDispose',
              child: AutoDisposePage(),
            ),
            CustomButton(
              title: 'KeepAlive',
              child: KeepAlivePage(),
            ),
            CustomButton(
              title: 'SyncKeepAlive',
              child: SyncKeepAlivePage(),
            ),
            CustomButton(
              title: 'AsyncKeepAlive',
              child: ProductsPage(),
            ),
            CustomButton(
              title: 'ProviderCascade',
              child: ProviderCascadePage(),
            ),
          ],
        ),
      ),
    );
  }
}
