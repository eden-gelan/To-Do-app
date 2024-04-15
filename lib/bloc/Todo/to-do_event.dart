import 'package:equatable/equatable.dart';

abstract class ToDOEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToDoload extends ToDOEvent {
  ToDoload();

  @override
  List<Object> get props => [];
}

final class AddToDoRequested extends ToDOEvent {
  final String title;
  final String description;
  final String status;
  final List<String> tags;
  final String date;

  AddToDoRequested(
      {required this.title,
      required this.description,
      required this.status,
      required this.tags,
      required this.date});
}

class DeleteToDoRequested extends ToDOEvent {
  final String todoId;

  DeleteToDoRequested({required this.todoId});

  @override
  List<Object> get props => [todoId];
}

class UpdateToDoStatusRequested extends ToDOEvent {
  final String todoId;
  final String newStatus;

  UpdateToDoStatusRequested({required this.todoId, required this.newStatus});

  @override
  List<Object> get props => [todoId, newStatus];
}

class PermanentDeleteToDoRequested extends ToDOEvent {
  final String todoId;

  PermanentDeleteToDoRequested({required this.todoId});
}
