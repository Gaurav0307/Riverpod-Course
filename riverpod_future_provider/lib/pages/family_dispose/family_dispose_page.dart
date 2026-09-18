import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider/pages/users/users_providers.dart';

class FamilyDisposePage extends ConsumerWidget {
  const FamilyDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userDetailProvider(1));
    ref.watch(userDetailProvider(2));

    return Scaffold(
      appBar: AppBar(title: const Text('Family Dispose')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              // Recreate all the family providers
              onPressed: () => ref.invalidate(userDetailProvider),
              child: const Text('Invalidate', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              // Recreate the single family provider
              onPressed: () => ref.refresh(userDetailProvider(1)),
              child: const Text('Refresh', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
