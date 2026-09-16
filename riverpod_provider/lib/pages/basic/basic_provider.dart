// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

/*
final helloProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[HelloProvider] Disposed');
  });

  return 'Hello';
});

final worldProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[WorldProvider] Disposed');
  });

  return 'World';
});
*/

@Riverpod(keepAlive: true)
String hello(Ref ref) {
  ref.onDispose(() {
    print('[HelloProvider] Disposed');
  });

  return 'Hello';
}

@Riverpod(keepAlive: true)
String world(Ref ref) {
  ref.onDispose(() {
    print('[WorldProvider] Disposed');
  });

  return 'World';
}
