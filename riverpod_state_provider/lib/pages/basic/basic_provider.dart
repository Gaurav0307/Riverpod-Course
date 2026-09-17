import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

final counterProvider = StateProvider<int>((ref) {
  print("[CounterProvider] created");

  ref.onDispose(() {
    print("[CounterProvider] disposed");
  });

  return 0;
});

@Riverpod(keepAlive: true)
String count(Ref ref) {
  print("[CountProvider] created");

  ref.onDispose(() {
    print("[CountProvider] disposed");
  });

  final counter = ref.watch(counterProvider);

  return "You have pressed the button\n $counter times.";
}
