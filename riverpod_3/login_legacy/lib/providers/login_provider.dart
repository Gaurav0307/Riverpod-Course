// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/auth_repository.dart';

part 'login_provider.g.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });

  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  @override
  List<Object> get props => [isLoading, isSuccess, errorMessage];

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, isSuccess: false, errorMessage: '');
    
    try {
      await ref
          .read(authRepositoryProvider)
          .login(email: email, password: password);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
