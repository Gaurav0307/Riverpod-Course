import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/pages/basic/basic_provider.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Consumer');

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final hello = ref.watch(helloProvider);
            final world = ref.watch(worldProvider);

            return Text(
              '$hello $world',
              style: const TextStyle(fontSize: 24.0),
            );
          },
        ),
      ),
    );
  }
}

class BasicPage1 extends ConsumerWidget {
  const BasicPage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('ConsumerWidget');

    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Text("$hello $world", style: const TextStyle(fontSize: 24.0)),
      ),
    );
  }
}

class BasicPage2 extends ConsumerStatefulWidget {
  const BasicPage2({super.key});

  @override
  ConsumerState<BasicPage2> createState() => _BasicPage2State();
}

class _BasicPage2State extends ConsumerState<BasicPage2> {
  @override
  Widget build(BuildContext context) {
    debugPrint('ConsumerStatefulWidget');

    // ConsumerStatefulWidget allows us to access ref directly.
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Text("$hello $world", style: const TextStyle(fontSize: 24.0)),
      ),
    );
  }
}
