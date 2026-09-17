import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/pages/family/family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incVal = ref.watch(counterFamilyStateProvider(10));
    final decVal = ref.watch(counterFamilyStateProvider(-10));

    return Scaffold(
      appBar: AppBar(title: const Text('FamilyStateProvider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$incVal', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 20),
              FilledButton(
                onPressed: () {
                  ref
                      .read(counterFamilyStateProvider(10).notifier)
                      .update((state) => state + 10);
                },
                child: Text("Increment by 10"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$decVal', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 20),
              FilledButton(
                onPressed: () {
                  ref
                      .read(counterFamilyStateProvider(-10).notifier)
                      .update((state) => state - 10);
                },
                child: Text("Decrement by 10"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
