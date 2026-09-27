import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class SyncKeepAliveCounter extends _$SyncKeepAliveCounter {
  @override
  int build() {
    final keepAliveLink = ref.keepAlive();

    Timer? timer;

    print("[SyncKeepAliveCounterProvider] initialized");

    ref.onDispose(() {
      print("[SyncKeepAliveCounterProvider] disposed & timer canceled");

      timer?.cancel();
    });

    ref.onCancel(() {
      print("[SyncKeepAliveCounterProvider] canceled & timer starts");

      timer = Timer(const Duration(seconds: 10), () {
        keepAliveLink.close();
      });
    });

    ref.onResume(() {
      print("[SyncKeepAliveCounterProvider] resumed & timer canceled");

      timer?.cancel();
    });

    ref.onAddListener(() {
      print("[SyncKeepAliveCounterProvider] added listener");
    });

    ref.onRemoveListener(() {
      print("[SyncKeepAliveCounterProvider] removed listener");
    });

    return 0;
  }

  void increment() => state++;

  void decrement() => state--;
}
