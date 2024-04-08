import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/model/to-do.dart';

class ToDoRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("todo");

  Future<void> create({
    required String title,
    required String description,
    required String status,
    required List tags,
    required String date,
  }) async {
    try {
      await _fireCloud.add({
        'title': title,
        'description': description,
        'status': status,
        'tags': tags,
        'date': date, // Convert DateTime to Timestamp
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ' ${e.code} : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Todo>> get() async {
    List<Todo> ToDoList = [];
    try {
      final todo = await FirebaseFirestore.instance.collection("todo").get();
      todo.docs.forEach((element) {
        String docId = element.id; // Get the ID of the document
        Todo todoItem = Todo.fromJson(element.data());
        todoItem = todoItem.copyWith(id: docId);
        ToDoList.add(todoItem);
      });
      return ToDoList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
      return ToDoList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> delete(String todoId) async {
    try {
      await _fireCloud.doc(todoId).update({'status': 'deleted'});
    } on FirebaseException catch (e) {
      print("Failed to delete todo with error '${e.code}' : ${e.message}");
      throw e;
    } catch (e) {
      print("Failed to delete todo with error: $e");
      throw Exception(e.toString());
    }
  }

  Future<void> updateStatus(String todoId, String newStatus) async {
    try {
      await _fireCloud.doc(todoId).update({'status': newStatus});
    } on FirebaseException catch (e) {
      print("Failed to update status with error '${e.code}' : ${e.message}");
      throw e;
    } catch (e) {
      print("Failed to update status with error: $e");
      throw Exception(e.toString());
    }
  }

  Future<void> permanentDelete(String todoId) async {
    try {
      await _fireCloud.doc(todoId).delete();
    } catch (e) {
      throw Exception('Failed to permanently delete todo: $e');
    }
  }
}
