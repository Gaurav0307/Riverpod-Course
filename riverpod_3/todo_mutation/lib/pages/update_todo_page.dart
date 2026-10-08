import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../providers/todo_list_provider.dart';

class UpdateTodoPage extends ConsumerStatefulWidget {
  const UpdateTodoPage({super.key, required this.todo});

  final Todo todo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends ConsumerState<UpdateTodoPage> {
  late final TextEditingController _controller;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.todo.description);
    _completed = widget.todo.completed;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<MutationState<void>>(updateTodoMutation(widget.todo.id), (
    //   previous,
    //   next,
    // ) {
    //   switch (next) {
    //     case MutationSuccess():
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(const SnackBar(content: Text("Todo updated!")));
    //       Navigator.pop(context);
    //     case MutationError(:final error):
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(SnackBar(content: Text("Error: $error")));
    //       setState(() {
    //         _controller = TextEditingController(text: widget.todo.description);
    //         _completed = widget.todo.completed;
    //       });
    //     case _:
    //   }
    // });

    final updateState = ref.watch(updateTodoMutation(widget.todo.id));

    return Scaffold(
      appBar: AppBar(title: const Text("Update Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              enabled: updateState is! MutationPending,
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text("Completed"),
              value: _completed,
              onChanged: (value) {
                setState(() {
                  _completed = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            switch (updateState) {
              MutationPending() => const CircularProgressIndicator(),
              _ => ElevatedButton(
                onPressed: () async {
                  if (_controller.text.trim().isNotEmpty) {
                    // updateTodoMutation(widget.todo.id).run(ref, (tsx) async {
                    //   await tsx
                    //       .get(todoListProvider.notifier)
                    //       .updateTodo(
                    //         widget.todo.id,
                    //         _controller.text,
                    //         _completed,
                    //       );
                    // }).ignore();

                    final messenger = ScaffoldMessenger.of(context);

                    try {
                      await updateTodoMutation(widget.todo.id)
                          .run(ref, (tsx) async {
                            await tsx
                                .get(todoListProvider.notifier)
                                .updateTodo(
                                  widget.todo.id,
                                  _controller.text,
                                  _completed,
                                );
                          });

                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text("Todo updated!")),
                        );
                      if (mounted) {
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("Error: $e")));
                    }
                  }
                },
                child: const Text("Update"),
              ),
            },
          ],
        ),
      ),
    );
  }
}
