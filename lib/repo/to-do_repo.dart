import 'package:todo/model/to-do.dart';

import '../Data provider/todo_provider.dart';

class ToDoRepository {
  final ToDoDataProvider _dataProvider;

  ToDoRepository({required ToDoDataProvider dataProvider})
      : _dataProvider = dataProvider;

  Future<void> createToDo({
    required String title,
    required String description,
    required String status,
    required List tags,
    required String date,
  }) async {
    await _dataProvider.create(
      title: title,
      description: description,
      status: status,
      tags: tags,
      date: date,
    );
  }

  Future<List<Todo>> getToDoList() async {
    return await _dataProvider.get();
  }

  Future<void> deleteToDo(String todoId) async {
    await _dataProvider.delete(todoId);
  }

  Future<void> updateToDoStatus(String todoId, String newStatus) async {
    await _dataProvider.updateStatus(todoId, newStatus);
  }

  Future<void> permanentDeleteToDo(String todoId) async {
    await _dataProvider.permanentDelete(todoId);
  }
}
