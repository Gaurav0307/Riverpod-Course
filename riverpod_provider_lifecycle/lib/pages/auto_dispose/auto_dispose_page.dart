import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider_lifecycle/pages/auto_dispose/providers.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(autoDisposeCounterProvider, (previous, next) {
      if (next % 3 == 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('Counter: $next')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDispose')),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final counter = ref.watch(autoDisposeCounterProvider);

            final counter1 = ref.watch(autoDisposeCounter1Provider);

            return Text(
              '$counter : $counter1',
              style: TextStyle(fontSize: 50.0),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
            onPressed: () =>
                ref.read(autoDisposeCounterProvider.notifier).decrement(),
          ),
          FloatingActionButton(
            heroTag: 'increment',
            child: const Icon(Icons.add),
            onPressed: () =>
                ref.read(autoDisposeCounter1Provider.notifier).increment(),
          ),
        ],
      ),
    );
  }
}
