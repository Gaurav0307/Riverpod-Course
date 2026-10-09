import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mutations/login_mutation.dart';
// import '../repository/auth_repository.dart';
import 'home_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<MutationState<void>>(loginMutation, (previous, next) {
      switch (next) {
        case MutationSuccess():
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        case MutationError(:final error):
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(error.toString())));
        case _:
      }
    });

    final loginState = ref.watch(loginMutation);

    return Scaffold(
      appBar: AppBar(title: const Text('Login Mutation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            const SizedBox(height: 24),
            loginState is MutationPending
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // loginMutation.run(ref, (tsx) async {
                      //   await tsx
                      //       .get(authRepositoryProvider)
                      //       .login(
                      //         email: _emailController.text,
                      //         password: _passwordController.text,
                      //       );
                      // }).ignore();

                      loginMutation.run(
                        ref,
                        (tsx) => LoginActions.login(
                          tsx,
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      ).ignore();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
