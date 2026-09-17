import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
    final counter = ref.watch(counterProvider);

    ref.listen<int>(counterProvider, (previous, next) {
      if (next == 3) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text("Counter: $next"));
          },
        );
      }
    });
    */

    final count = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      // body: Center(child: Text('$counter', style: TextStyle(fontSize: 24))),
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
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
