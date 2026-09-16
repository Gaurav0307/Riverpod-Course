import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyHelloProvider = Provider.family<String, String>((ref, name) {
  print('[FamilyHelloProvider($name)] Created');

  ref.onDispose(() {
    print('[FamilyHelloProvider($name)] Disposed');
  });

  return 'Hello $name';
});
