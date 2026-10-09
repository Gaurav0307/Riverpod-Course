import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final _mockDB = {
    "admin@email.com": "password123",
    "user@email.com": "123456",
  };

  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (_mockDB.containsKey(email) && _mockDB[email] != password) {
      throw Exception("Invalid credentials!!! ");
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}
