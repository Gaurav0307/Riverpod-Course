// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_provider.g.dart';

/*
final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
  print('[AutoDisposeHelloProvider] Created');

  ref.onDispose(() {
    print('[AutoDisposeHelloProvider] Disposed');
  });

  return 'Hello';
});

final autoDisposeWorldProvider = Provider.autoDispose<String>((ref) {
  print('[AutoDisposeWorldProvider] Created');

  ref.onDispose(() {
    print('[AutoDisposeWorldProvider] Disposed');
  });

  return 'World';
});
*/

@riverpod
String autoDisposeHello(Ref ref) {
  print('[AutoDisposeHelloProvider] Created');

  ref.onDispose(() {
    print('[AutoDisposeHelloProvider] Disposed');
  });

  return 'Hello';
}

@riverpod
String autoDisposeWorld(Ref ref) {
  print('[AutoDisposeWorldProvider] Created');

  ref.onDispose(() {
    print('[AutoDisposeWorldProvider] Disposed');
  });

  return 'World';
}
