import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_lifecycle/pages/keep_alive/providers.dart';

class KeepAlivePage extends ConsumerWidget {
  const KeepAlivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(keepAliveCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('KeepAlive')),
      body: Center(child: Text('$counter', style: TextStyle(fontSize: 50.0))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () =>
                ref.read(keepAliveCounterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () =>
                ref.read(keepAliveCounterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
