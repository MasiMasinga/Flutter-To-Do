import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:to_do/models/todo.dart';

class TodoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'todos';

  Future<void> addTodo(Todo todo) async {
    try {
      await _firestore.collection(_collectionPath).add(todo.toMap());
    } catch (e) {
      print('Error adding todo: $e');
      throw Exception('Failed to add todo');
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _firestore
          .collection(_collectionPath)
          .doc(todo.id)
          .update(todo.toMap());
    } catch (e) {
      print('Error updating todo: $e');
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(String todoId) async {
    try {
      await _firestore.collection(_collectionPath).doc(todoId).delete();
    } catch (e) {
      print('Error deleting todo: $e');
      throw Exception('Failed to delete todo');
    }
  }

  Stream<List<Todo>> getTodos() {
    return _firestore
        .collection(_collectionPath)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Todo(
                id: doc.id,
                title: data['title'] ?? '',
                description: data['description'] ?? '',
                isCompleted: data['isCompleted'] ?? false,
              );
            }).toList());
  }
}
