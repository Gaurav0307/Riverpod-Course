import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_lifecycle/pages/provider_cascade/providers.dart';

class ProviderCascadePage extends ConsumerWidget {
  const ProviderCascadePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final age = ref.watch(ageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Cascade')),
      body: Center(
        child: Text(
          age,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () =>
                ref.read(cascadeCounterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () =>
                ref.read(cascadeCounterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
