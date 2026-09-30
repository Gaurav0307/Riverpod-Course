import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_subtree_scope/providers/providers.dart';

class Example1Page extends ConsumerWidget {
  const Example1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usage Example 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddOne(),
            Divider(height: 50),
            ProviderScope(overrides: [counterProvider], child: AddTen()),
            Divider(height: 50),
            ProviderScope(
              overrides: [counterProvider.overrideWith(() => Counter100())],
              child: AddHundred(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddOne extends ConsumerWidget {
  const AddOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Column(
      children: [
        Text('$counter', style: TextStyle(fontSize: 40)),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment(1);
          },
          child: const Text('Add 1'),
        ),
      ],
    );
  }
}

class AddTen extends ConsumerWidget {
  const AddTen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Column(
      children: [
        Text('$counter', style: TextStyle(fontSize: 40)),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment(10);
          },
          child: const Text('Add 10'),
        ),
      ],
    );
  }
}

class AddHundred extends ConsumerWidget {
  const AddHundred({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Column(
      children: [
        Text('$counter', style: TextStyle(fontSize: 40)),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment(100);
          },
          child: const Text('Add 100'),
        ),
      ],
    );
  }
}
