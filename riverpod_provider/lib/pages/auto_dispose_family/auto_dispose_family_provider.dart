// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_family_provider.g.dart';

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

final autoDisposeFamilyHelloProvider = Provider.autoDispose
    .family<String, String>((ref, name) {
      print('[AutoDisposeFamilyHelloProvider($name)] Created');

      ref.onDispose(() {
        print('[AutoDisposeFamilyHelloProvider($name)] Disposed');
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
String autoDisposeFamilyHello(Ref ref, String there) {
  print('[AutoDisposeFamilyHelloProvider($there)] Created');

  ref.onDispose(() {
    print('[AutoDisposeFamilyHelloProvider($there)] Disposed');
  });

  return 'Hello $there';
}
