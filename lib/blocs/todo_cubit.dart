import 'package:bloc/bloc.dart';

// Models
import 'package:to_do/models/todo.dart';

// Repositories
import 'package:to_do/repositories/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super([]) {
    _loadTodos();
  }

  void emitError(String errorMessage) {
    emitError(errorMessage);
  }

  Future<void> _loadTodos() async {
    try {
      final todos = await _todoRepository.getTodos().first;
      emit(todos);
    } catch (e) {
      print('Error loading todos: $e');
      emitError('Failed to load todos');
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _todoRepository.addTodo(todo);
      _loadTodos();
    } catch (e) {
      print('Error adding todo: $e');
      emitError('Failed to add todo');
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _todoRepository.updateTodo(todo);
      _loadTodos();
    } catch (e) {
      print('Error updating todo: $e');
      emitError('Failed to update todo');
    }
  }

  Future<void> deleteTodo(String todoId) async {
    try {
      await _todoRepository.deleteTodo(todoId);
      _loadTodos();
    } catch (e) {
      print('Error deleting todo: $e');
      emitError('Failed to delete todo');
    }
  }
}
