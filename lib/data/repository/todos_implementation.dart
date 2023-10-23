import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_todo_riverpod/data/source/files.dart';
import 'package:flutter_todo_riverpod/domain/model/todo.dart';
import 'package:flutter_todo_riverpod/domain/model/todos.dart';
import 'package:flutter_todo_riverpod/domain/repository/todos.dart';

class TodosRepositoryImplementation extends TodosRepository {
  final Files files;
  TodosRepositoryImplementation(this.files);
  late final String path = 'todos.json';

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos = todos.values.where((element) => element.id != todo.id).toList();
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<Todos> loadTodos() async {
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);

    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(int id) async {
    final todos = await loadTodos();
    final todo = todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos = todos.values.where((element) => element.id != todo.id).toList();
    newTodos.add(todo);
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }
}
