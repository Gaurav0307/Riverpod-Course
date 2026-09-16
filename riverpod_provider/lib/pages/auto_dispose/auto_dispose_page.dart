import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/pages/auto_dispose/auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(autoDisposeHelloProvider);
    final world = ref.watch(autoDisposeWorldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeProvider')),
      body: Center(
        child: Text('$hello $world', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }
}
