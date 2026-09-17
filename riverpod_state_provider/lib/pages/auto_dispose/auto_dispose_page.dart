import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/pages/auto_dispose/auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(autoDisposeCountProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeStateProvider')),
      body: Center(
        child: Text(
          count,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref
              .read(autoDisposeCounterProvider.notifier)
              .update((state) => state + 10);
        },
      ),
    );
  }
}
