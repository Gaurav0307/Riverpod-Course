import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_notifier_provider/pages/todos_provider.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    print(todos);

    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Column(
        children: [
          AddTodo(),
          const SizedBox(height: 20),
          /*
          ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              
              return ListTile(
                leading: Checkbox(
                  value: todo.completed,
                  onChanged: (value) {
                    ref
                        .read(todoProvider.notifier)
                        .toggleCompleted(id: todo.id);
                  },
                ),
                title: Text(todo.desc),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref.read(todoProvider.notifier).delete(id: todo.id);
                  },
                ),
              );
            },
          ),
          */
          ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: todo.completed,
                onChanged: (value) {
                  ref.read(todoProvider.notifier).toggleCompleted(id: todo.id);
                },
                title: Text(todo.desc),
                secondary: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref.read(todoProvider.notifier).delete(id: todo.id);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'New Todo'),
        onFieldSubmitted: (desc) {
          if (desc.isEmpty) return;

          ref.read(todoProvider.notifier).add(desc: desc);

          controller.clear();
        },
      ),
    );
  }
}
