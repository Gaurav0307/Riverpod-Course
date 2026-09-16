import 'package:flutter_riverpod/flutter_riverpod.dart';

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
