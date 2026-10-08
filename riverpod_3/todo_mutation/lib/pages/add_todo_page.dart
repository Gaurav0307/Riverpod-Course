import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/todo_list_provider.dart';

class AddTodoPage extends ConsumerStatefulWidget {
  const AddTodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends ConsumerState<AddTodoPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<MutationState<void>>(addTodoMutation, (previous, next) {
    //   switch (next) {
    //     case MutationSuccess():
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(const SnackBar(content: Text("Todo added!")));
    //       _controller.clear();
    //     case MutationError(:final error):
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(SnackBar(content: Text("Error: $error")));
    //     case _:
    //   }
    // });

    final addState = ref.watch(addTodoMutation);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              enabled: addState is! MutationPending,
            ),
            const SizedBox(height: 16.0),
            switch (addState) {
              MutationPending() => const CircularProgressIndicator(),
              _ => ElevatedButton(
                onPressed: () async {
                  if (_controller.text.trim().isNotEmpty) {
                    // addTodoMutation.run(ref, (tsx) async {
                    //   await tsx
                    //       .get(todoListProvider.notifier)
                    //       .addTodo(_controller.text);
                    // }).ignore();

                    final messenger = ScaffoldMessenger.of(context);

                    try {
                      await addTodoMutation.run(ref, (tsx) async {
                        await tsx
                            .get(todoListProvider.notifier)
                            .addTodo(_controller.text);
                      });

                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(content: Text("Todo added!")));
                    } catch (e) {
                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("Error: $e")));
                    }
                  }
                },
                child: const Text("Add"),
              ),
            },
          ],
        ),
      ),
    );
  }
}
