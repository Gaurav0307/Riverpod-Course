// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider.g.dart';

/*
final familyHelloProvider = Provider.family<String, String>((ref, name) {
  print('[FamilyHelloProvider($name)] Created');

  ref.onDispose(() {
    print('[FamilyHelloProvider($name)] Disposed');
  });

  return 'Hello $name';
});
*/

@Riverpod(keepAlive: true)
String familyHello(Ref ref, String there) {
  print('[FamilyHelloProvider($there)] Created');

  ref.onDispose(() {
    print('[FamilyHelloProvider($there)] Disposed');
  });

  return 'Hello $there';
}
