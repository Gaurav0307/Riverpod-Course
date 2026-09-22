import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_async_notifier_provider/pages/counter/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counter1Provider(1));

    print(counter);

    print(
      "isLoading: ${counter.isLoading}, isRefreshing: ${counter.isRefreshing}, isReloading: ${counter.isReloading}",
    );

    print("hasValue: ${counter.hasValue}, hasError: ${counter.hasError}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counter1Provider(1));
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: counter.when(
          data: (value) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${counter.value}',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: () {
                      ref.read(counter1Provider(1).notifier).decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: () {
                      ref.read(counter1Provider(1).notifier).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          error: (error, stackTrace) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              const SizedBox(height: 20.0),
              OutlinedButton.icon(
                onPressed: () {
                  ref.invalidate(counter1Provider(1));
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
