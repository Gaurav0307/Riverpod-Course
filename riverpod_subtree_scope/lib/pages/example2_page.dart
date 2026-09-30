import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_subtree_scope/providers/providers.dart';

class Example2Page extends ConsumerWidget {
  const Example2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usage Example 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProviderScope(
              overrides: [counterProvider],
              child: CounterDisplay(),
            ),
            Divider(height: 40),
            ProviderScope(
              overrides: [counterProvider.overrideWith(() => Counter10())],
              child: CounterDisplay(),
            ),
            Divider(height: 40),
            ProviderScope(
              overrides: [
                counterProvider.overrideWith(() => Counter100()),
                adjustedCounterProvider.overrideWith(
                  (ref) => ref.watch(counterProvider) * 3,
                ),
              ],
              child: CounterDisplay(),
            ),
            Divider(height: 40),
            CounterDisplay(),
          ],
        ),
      ),
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final adjustedCounter = ref.watch(adjustedCounterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: TextStyle(fontSize: 40)),
            SizedBox(width: 30),
            Text('$adjustedCounter', style: TextStyle(fontSize: 40)),
          ],
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment(1);
          },
          child: const Text('Increment Counter'),
        ),
      ],
    );
  }
}
