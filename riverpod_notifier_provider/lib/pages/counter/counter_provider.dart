// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

/*
final counterProvider = NotifierProvider<Counter, int>(() {
  return Counter();
});
*/

// Same as above. The difference is that, here we are using constructor tear-off syntax.
/*
final counterProvider = NotifierProvider<Counter, int>(Counter.new);

final autoDisposeCounterProvider = NotifierProvider.autoDispose<Counter, int>(
  Counter.new,
);

class Counter extends Notifier<int> {
  @override
  build() {
    print("[CounterNotifier] created");

    ref.onDispose(() {
      print("[CounterNotifier] disposed");
    });

    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
*/

/*
final familyCounterProvider = NotifierProvider.family<Counter1, int, int>(
  (initialValue) => Counter1(initialValue),
);
*/

// Same as above. The difference is that, here we are using constructor tear-off syntax.
/*
final familyCounterProvider = NotifierProvider.family<Counter1, int, int>(
  Counter1.new,
);

final autoDisposeFamilyCounterProvider = NotifierProvider.autoDispose
    .family<Counter1, int, int>(Counter1.new);

class Counter1 extends Notifier<int> {
  Counter1(this._initialValue);

  final int _initialValue;

  @override
  build() {
    print("[CounterNotifier] created");

    ref.onDispose(() {
      print("[CounterNotifier] disposed");
    });

    return _initialValue;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
*/

@riverpod
class Counter extends _$Counter {
  @override
   int build(int initialValue) {
    print("[CounterNotifier] created");

    ref.onDispose(() {
      print("[CounterNotifier] disposed");
    });

    return initialValue;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

@Riverpod(keepAlive: true)
class Counter1 extends _$Counter1 {
  @override
   int build(int initialValue) {
    print("[CounterNotifier] created");

    ref.onDispose(() {
      print("[CounterNotifier] disposed");
    });

    return initialValue;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}