// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Equatable {
  final int count;

  const Counter(this.count);

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

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
