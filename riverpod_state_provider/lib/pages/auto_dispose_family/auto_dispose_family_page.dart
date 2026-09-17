import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incVal = ref.watch(autoDisposeCounterFamilyStateProvider(10));
    final decVal = ref.watch(autoDisposeCounterFamilyStateProvider(-10));

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
                      .read(autoDisposeCounterFamilyStateProvider(10).notifier)
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
                      .read(autoDisposeCounterFamilyStateProvider(-10).notifier)
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
