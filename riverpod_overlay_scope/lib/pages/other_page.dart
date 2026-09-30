import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_overlay_scope/providers/counter_provider.dart';

class OtherPage extends ConsumerWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other')),
      body: Center(
        child: Text(
          '${ref.watch(counterProvider)}',
          style: TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
