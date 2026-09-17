import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_provider.g.dart';

final autoDisposeCounterProvider = StateProvider.autoDispose<int>((ref) {
  print("[AutoDisposeCounterProvider] created");

  ref.onDispose(() {
    print("[AutoDisposeCounterProvider] disposed");
  });

  return 0;
});

@Riverpod(keepAlive: false)
String autoDisposeCount(Ref ref) {
  print("[AutoDisposeCountProvider] created");

  ref.onDispose(() {
    print("[AutoDisposeCountProvider] disposed");
  });

  final counter = ref.watch(autoDisposeCounterProvider);

  return "You have pressed the button\n $counter times.";
}
