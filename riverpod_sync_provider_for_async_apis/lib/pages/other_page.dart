import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sync_provider_for_async_apis/providers/providers.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
              // final preferences = ref.watch(sharedPreferencesProvider);

              // final counter = preferences.getInt('counter') ?? 0;

            final counter = ref.watch(counterProvider);

            return Text('$counter', style: TextStyle(fontSize: 52));
          },
        ),
      ),
    );
  }
}
