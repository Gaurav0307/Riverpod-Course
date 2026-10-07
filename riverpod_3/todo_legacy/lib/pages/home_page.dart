import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../providers/completed_count_provider.dart';
import '../providers/filtered_todos_provider.dart';
import '../providers/todo_list_provider.dart';
import '../providers/todo_list_state.dart';
import 'add_todo_page.dart';
import 'update_todo_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<TodoListState>>(todoListProvider, (previous, next) {
      next.whenData((state) {
        switch (state.status) {
          case TodoListStatus.deleted:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text("Todo deleted!")));
            ref.read(todoListProvider.notifier).clearStatus();
          case TodoListStatus.deleteFailure:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Error: ${next.value?.transientFailure}"),
                ),
              );
            ref.read(todoListProvider.notifier).clearTransientFailure();
          case _:
        }
      });
    });

    final todoAsync = ref.watch(todoListProvider);

    return todoAsync.when(
      data: (todoListState) {
        final todos = todoListState.todos;
        final completedCount = ref.watch(completedCountProvider);

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("$completedCount/${todos.length} Completed"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => const AddTodoPage()),
                    );
                  },
                ),
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Completed"),
                  Tab(text: "Pending"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                TodoList(filter: "all"),
                TodoList(filter: "completed"),
                TodoList(filter: "pending"),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          appBar: AppBar(title: const Text("Initialization Error")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  "Failed to fetch data!\n${todoAsync.error}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(todoListProvider),
                  child: const Text("Retry"),
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({super.key, required this.filter});

  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(filteredTodosProvider(filter));

    return ListView.builder(
      itemCount: filteredTodos.length,
      itemBuilder: (_, index) {
        final todo = filteredTodos[index];

        return TodoItem(todo: todo);
      },
    );
  }
}

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletingTodoId = ref.watch(
      todoListProvider.select((state) => state.value?.deletingTodoId),
    );

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateTodoPage(todo: todo)),
        );
      },
      title: Text(
        todo.description,
        style: todo.completed
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: deletingTodoId == todo.id
          ? Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 10),
              child: const CircularProgressIndicator(strokeWidth: 3),
            )
          : IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () =>
                  ref.read(todoListProvider.notifier).deleteTodo(todo.id),
            ),
    );
  }
}
