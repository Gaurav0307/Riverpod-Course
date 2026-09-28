import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class CascadeCounter extends _$CascadeCounter {
  @override

  int build() {
    print("[CascadeCounterProvider] initialized");

    ref.onDispose(() {
      print("[CascadeCounterProvider] disposed");
    });

    ref.onCancel(() {
      print("[CascadeCounterProvider] canceled");
    });

    ref.onResume(() {
      print("[CascadeCounterProvider] resumed");
    });

    ref.onAddListener(() {
      print("[CascadeCounterProvider] added listener");
    });

    ref.onRemoveListener(() {
      print("[CascadeCounterProvider] removed listener");
    });

    return 0;
  }

  void increment() => state++;

  void decrement() => state--;
}

@riverpod
String age(Ref ref) {
  print("[AgeProvider] initialized");

  ref.onDispose(() {
    print("[AgeProvider] disposed");
  });

  ref.onCancel(() {
    print("[AgeProvider] canceled");
  });

  ref.onResume(() {
    print("[AgeProvider] resumed");
  });

  ref.onAddListener(() {
    print("[AgeProvider] added listener");
  });

  ref.onRemoveListener(() {
    print("[AgeProvider] removed listener");
  });

  final counter = ref.watch(cascadeCounterProvider);

  return "I am $counter years old.";
}