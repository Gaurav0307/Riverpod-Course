import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloJohn = ref.watch(autoDisposeFamilyHelloProvider('John'));
    final helloJane = ref.watch(autoDisposeFamilyHelloProvider('Jane'));

    ref.watch(autoDisposeFamilyCounterProvider(Counter(0)));
    ref.watch(autoDisposeFamilyCounterProvider(Counter(0)));

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeFamilyProvider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(helloJohn, style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 10.0),
            Text(helloJane, style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
