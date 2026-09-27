import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class KeepAliveCounter extends _$KeepAliveCounter {
  @override
  int build() {
    print("[KeepAliveCounterProvider] initialized");

    ref.onDispose(() {
      print("[KeepAliveCounterProvider] disposed");
    });

    ref.onCancel(() {
      print("[KeepAliveCounterProvider] canceled");
    });

    ref.onResume(() {
      print("[KeepAliveCounterProvider] resumed");
    });

    ref.onAddListener(() {
      print("[KeepAliveCounterProvider] added listener");
    });

    ref.onRemoveListener(() {
      print("[KeepAliveCounterProvider] removed listener");
    });

    return 0;
  }

  void increment() => state++;

  void decrement() => state--;
}