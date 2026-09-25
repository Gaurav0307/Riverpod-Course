import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'pages/weather_first/weather_first_page.dart';
import 'pages/weather_second/weather_second_page.dart';
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
      title: 'AsyncValue Details',
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
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            CustomButton(title: 'WeatherFirst', child: WeatherFirstPage()),
            CustomButton(title: 'WeatherSecond', child: WeatherSecondPage()),
          ],
        ),
      ),
    );
  }
}
