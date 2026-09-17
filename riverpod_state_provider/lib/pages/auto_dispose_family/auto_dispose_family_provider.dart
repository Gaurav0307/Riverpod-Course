import 'package:flutter_riverpod/legacy.dart';

final autoDisposeCounterFamilyStateProvider = StateProvider.autoDispose
    .family<int, int>((ref, initialValue) {
      print("[AutoDisposeCounterFamilyStateProvider] created");

      ref.onDispose(() {
        print("[AutoDisposeCounterFamilyStateProvider] disposed");
      });

      return initialValue;
    });
