import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/pages/auto_dispose_family_test/auto_dispose_family_test_provider.dart';

class AutoDisposeFamilyTestPage extends ConsumerStatefulWidget {
  const AutoDisposeFamilyTestPage({super.key});

  @override
  ConsumerState<AutoDisposeFamilyTestPage> createState() =>
      _AutoDisposeFamilyTestPageState();
}

class _AutoDisposeFamilyTestPageState
    extends ConsumerState<AutoDisposeFamilyTestPage> {
  String name = 'John';

  @override
  Widget build(BuildContext context) {
    final helloThere = ref.watch(autoDisposeFamilyTestHelloProvider(name));

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeFamilyTestProvider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(helloThere, style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 10.0),
            FilledButton(
              onPressed: () {
                setState(() {
                  name == 'Jane' ? name = 'John' : name = 'Jane';
                });
              },
              child: const Text('Change Name'),
            ),
          ],
        ),
      ),
    );
  }
}
