import 'package:flutter_todo_riverpod/domain/model/todo.dart';
import 'package:flutter_todo_riverpod/domain/model/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<Todo?> getTodoById(int id);
  Future<void> deleteAllTodos();
}
