import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../providers/todo_list_provider.dart';
import '../providers/todo_list_state.dart';

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
    ref.listen<AsyncValue<TodoListState>>(todoListProvider, (previous, next) {
      next.whenData((state) {
        switch (state.status) {
          case TodoListStatus.updated:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text("Todo updated!")));
            Navigator.pop(context);
          case TodoListStatus.updateFailure:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Error: ${next.value?.transientFailure}"),
                ),
              );
            ref.read(todoListProvider.notifier).clearTransientFailure();
            setState(() {
              _controller = TextEditingController(
                text: widget.todo.description,
              );
              _completed = widget.todo.completed;
            });
          case _:
        }
      });
    });

    final updateState = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Update Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              enabled: updateState.value?.status != TodoListStatus.updating,
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
            switch (updateState.value?.status) {
              TodoListStatus.updating => const CircularProgressIndicator(),
              _ => ElevatedButton(
                onPressed: () {
                  if (_controller.text.trim().isNotEmpty) {
                    ref
                        .read(todoListProvider.notifier)
                        .updateTodo(
                          widget.todo.id,
                          _controller.text,
                          _completed,
                        );
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
