import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/to-do.dart';

class FirestoreService {
  final CollectionReference _todoCollection =
      FirebaseFirestore.instance.collection('todos');

  Future<void> addTodo(Todo todo) async {
    await _todoCollection.add(todo.toJson());
  }

  Stream<List<Todo>> getTodos() {
    return _todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Todo.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> deleteTodo(String todoId) async {
    await _todoCollection.doc(todoId).delete();
  }
}
