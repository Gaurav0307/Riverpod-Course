import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increment(int incrementBy) {
    state = state + incrementBy;
  }
}

class Counter10 extends Counter {
  @override
  int build() {
    return 10;
  }
}

class Counter100 extends Counter {
  @override
  int build() {
    return 100;
  }
}

@Riverpod(dependencies: [Counter])
int adjustedCounter(Ref ref) {
  return ref.watch(counterProvider) * 2;
}



