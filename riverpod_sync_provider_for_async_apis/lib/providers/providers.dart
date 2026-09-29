import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);

    final currentValue = preferences.getInt('counter') ?? 0;

    listenSelf((previous, next) {
      print('previous: $previous, next: $next');

      preferences.setInt('counter', next);
    });
    
    return currentValue;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}