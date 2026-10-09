import 'package:flutter_riverpod/experimental/mutation.dart';

import '../repository/auth_repository.dart';

final loginMutation = Mutation<void>();

abstract class LoginActions {
  static Future<void> login(
    MutationTransaction tsx, {
    required String email,
    required String password,
  }) async {
    await tsx
        .get(authRepositoryProvider)
        .login(email: email, password: password);
  }
}
