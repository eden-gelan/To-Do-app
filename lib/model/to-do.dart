import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String? id; // Nullable id parameter
  final String title;
  final String description;
  final String status;
  final List<String> tags;
  final String date;

  Todo({
    this.id, // Nullable id parameter
    required this.title,
    required this.description,
    required this.status,
    required this.tags,
    required this.date,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as String?,
        title: json['title'] as String,
        description: json['description'] as String,
        status: json['status'] as String,
        tags: (json['tags'] as List<dynamic>).cast<String>(),
        date: json['date'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'status': status,
        'tags': tags,
        'date': date,
      };

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    List<String>? tags,
    String? date,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      tags: tags ?? this.tags,
      date: date ?? this.date,
    );
  }

  // Create a method to convert Firestore DocumentSnapshot to Todo object
  static Todo fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id; // Include the document ID
    return Todo.fromJson(data);
  }
}
