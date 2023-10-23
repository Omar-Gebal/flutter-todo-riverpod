import 'package:flutter_todo_riverpod/presentation/screens/home.dart';
import 'package:flutter_todo_riverpod/presentation/screens/todos_list.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      redirect: (context, state) => '/todos',
      routes: [
        GoRoute(path: 'todos', builder: (context, state) => const TodosList()),
      ],
    ),
  ],
);
