import 'package:flutter_riverpod/legacy.dart';

final counterFamilyStateProvider = StateProvider.family<int, int>((
  ref,
  initialValue,
) {
  print("[CounterFamilyStateProvider] created");

  ref.onDispose(() {
    print("[CounterFamilyStateProvider] disposed");
  });

  return initialValue;
});
