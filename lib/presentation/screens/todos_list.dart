import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/presentation/viewmodel/module.dart';
import 'package:go_router/go_router.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos'),
      ),
      body: ref.watch(getTodosProvider).map(
            data: (todos) => ListView.builder(
              itemCount: todos.value.values.length,
              itemBuilder: (context, index) {
                final todo = todos.value.values[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: todo.description != null ? Text(todo.description!) : null,
                );
              },
            ),
            error: (error) => Center(
              child: Text(error.stackTrace.toString()),
            ),
            loading: (_) => const CircularProgressIndicator(),
          ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        context.go('/todos/add');
      }, icon: const Icon(Icons.add), label: const Text('Add Todo'), tooltip: 'Add Todo', W),
    );
  }
}
