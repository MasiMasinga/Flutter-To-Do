import 'package:bloc/bloc.dart';

// Models
import 'package:to_do/models/todo.dart';

// Repositories
import 'package:to_do/repositories/todo_repository.dart';


class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super([]);

}
