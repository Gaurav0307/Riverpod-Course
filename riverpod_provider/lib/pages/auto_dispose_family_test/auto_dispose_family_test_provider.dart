import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_family_test_provider.g.dart';

class Counter extends Equatable {
  final int count;

  const Counter(this.count);

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

/*
final autoDisposeFamilyCounterProvider = Provider.autoDispose
    .family<int, Counter>((ref, c) {
      print('[AutoDisposeFamilyCounterProvider($c)] Created');

      ref.onDispose(() {
        print('[AutoDisposeFamilyCounterProvider($c)] Disposed');
      });

      return c.count;
    });

final autoDisposeFamilyTestHelloProvider = Provider.autoDispose
    .family<String, String>((ref, name) {
      print('[AutoDisposeFamilyTestHelloProvider($name)] Created');

      ref.onDispose(() {
        print('[AutoDisposeFamilyTestHelloProvider($name)] Disposed');
      });

      return 'Hello $name';
    });
*/

@riverpod
int autoDisposeFamilyCounter(Ref ref, Counter c) {
  print('[AutoDisposeFamilyCounterProvider($c)] Created');

  ref.onDispose(() {
    print('[AutoDisposeFamilyCounterProvider($c)] Disposed');
  });

  return c.count;
}

@riverpod
String autoDisposeFamilyTestHello(Ref ref, String there) {
  print('[AutoDisposeFamilyTestHelloProvider($there)] Created');

  ref.onDispose(() {
    print('[AutoDisposeFamilyTestHelloProvider($there)] Disposed');
  });

  return 'Hello $there';
}
