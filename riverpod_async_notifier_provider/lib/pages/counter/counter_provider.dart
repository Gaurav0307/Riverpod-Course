import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'counter_provider.g.dart';

/*
final counterProvider = AsyncNotifierProvider<Counter, int>(Counter.new);

final autoDisposeCounterProvider =
    AsyncNotifierProvider.autoDispose<Counter, int>(Counter.new);

class Counter extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    print("[CounterAsyncNotifier] created");

    ref.onDispose(() {
      print("[CounterAsyncNotifier] disposed");
    });

    await waitSecond();
    return 0;
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));

  Future<void> increment() async {
    state = const AsyncLoading();

    /*
    try {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      state = AsyncData(state.value! + 1);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
    */

    // with guard (better approach than above)
    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      return state.value! + 1;
    });
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    /*
    try {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      state = AsyncData(state.value! - 1);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
    */

    // with guard (better approach than above)
    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      return state.value! - 1;
    });
  }
}

final familyCounterProvider = AsyncNotifierProvider.family<Counter1, int, int>(Counter1.new);

final autoDisposeFamilyCounterProvider =
    AsyncNotifierProvider.autoDispose.family<Counter1, int, int>(Counter1.new);

class Counter1 extends AsyncNotifier<int> {
  Counter1(this._initialValue);

  final int _initialValue;


  @override
  FutureOr<int> build() async {
    print("[CounterAsyncNotifier] created");

    ref.onDispose(() {
      print("[CounterAsyncNotifier] disposed");
    });

    await waitSecond();
    return _initialValue;
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));

  Future<void> increment() async {
    state = const AsyncLoading();

    /*
    try {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      state = AsyncData(state.value! + 1);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
    */

    // with guard (better approach than above)
    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      return state.value! + 1;
    });
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    /*
    try {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      state = AsyncData(state.value! - 1);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
    */

    // with guard (better approach than above)
    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      return state.value! - 1;
    });
  }
}
*/

@riverpod
class Counter extends _$Counter {
  @override
  FutureOr<int> build(int initialValue) async {
  print("[CounterAsyncNotifier] created");

    ref.onDispose(() {
      print("[CounterAsyncNotifier] disposed");
    });

    await waitSecond();
    return initialValue;
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));

  Future<void> increment() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      return state.value! + 1;
    });
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      return state.value! - 1;
    });
  }
}

@Riverpod(keepAlive: true)
class Counter1 extends _$Counter1 {
  @override
  FutureOr<int> build(int initialValue) async {
  print("[CounterAsyncNotifier] created");

    ref.onDispose(() {
      print("[CounterAsyncNotifier] disposed");
    });

    await waitSecond();
    return initialValue;
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));

  Future<void> increment() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! > 5) {
        throw Exception("Failed to increment!");
      }

      return state.value! + 1;
    });
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await waitSecond();

      if (state.value! < -5) {
        throw Exception("Failed to decrement!");
      }

      return state.value! - 1;
    });
  }
}