import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/data/repository/todos_implementation.dart';
import 'package:flutter_todo_riverpod/data/source/module.dart';
import 'package:flutter_todo_riverpod/domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImplementation(ref.read(filesProvider));
});
