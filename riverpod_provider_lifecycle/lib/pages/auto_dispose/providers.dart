import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class AutoDisposeCounter extends _$AutoDisposeCounter {
  @override
  int build() {
    print("[AutoDisposeCounterProvider] initialized");

    ref.onDispose(() {
      print("[AutoDisposeCounterProvider] disposed");
    });

    ref.onCancel(() {
      print("[AutoDisposeCounterProvider] canceled");
    });

    ref.onResume(() {
      print("[AutoDisposeCounterProvider] resumed");
    });

    ref.onAddListener(() {
      print("[AutoDisposeCounterProvider] added listener");
    });

    ref.onRemoveListener(() {
      print("[AutoDisposeCounterProvider] removed listener");
    });

    return 0;
  }

  void increment() => state++;

  void decrement() => state--;
}

@riverpod
class AutoDisposeCounter1 extends _$AutoDisposeCounter1 {
  @override
  int build() {
    print("[AutoDisposeCounter1Provider] initialized");

    ref.onDispose(() {
      print("[AutoDisposeCounter1Provider] disposed");
    });

    ref.onCancel(() {
      print("[AutoDisposeCounter1Provider] canceled");
    });

    ref.onResume(() {
      print("[AutoDisposeCounter1Provider] resumed");
    });

    ref.onAddListener(() {
      print("[AutoDisposeCounter1Provider] added listener");
    });

    ref.onRemoveListener(() {
      print("[AutoDisposeCounter1Provider] removed listener");
    });

    return 0;
  }

  void increment() => state++;

  void decrement() => state--;
}
