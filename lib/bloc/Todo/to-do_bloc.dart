import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/Todo/to-do_event.dart';
import 'package:todo/repo/to-do_repo.dart';
import 'to-do_state.dart';

class ToDoBloc extends Bloc<ToDOEvent, ToDoState> {
  final ToDoRepository toDoRepository;
  ToDoBloc({required this.toDoRepository}) : super(ToDoLoading()) {
    on<AddToDoRequested>((event, emit) async {
      try {
        await toDoRepository.createToDo(
            title: event.title,
            description: event.description,
            status: event.status,
            tags: event.tags,
            date: event.date);
        final data = await toDoRepository.getToDoList();

        emit(ToDoLoadSuccess(
          todos: data,
          isInitialLoad: false, // Indicate it's the initial load
        ));
      } catch (e) {
        emit(ToDoOperationFailure());
      }
    });

    on<ToDoload>((event, emit) async {
      emit(ToDoLoading());
      try {
        final data = await toDoRepository.getToDoList();
        emit(ToDoLoadSuccess(
          todos: data,
          isInitialLoad: true, // Indicate it's the initial load
        ));
      } catch (e) {
        FlutterError.reportError(FlutterErrorDetails(exception: e));
        emit(ToDoOperationFailure());
      }
    });

    on<DeleteToDoRequested>((event, emit) async {
      try {
        await toDoRepository.deleteToDo(event.todoId);
        final data = await toDoRepository.getToDoList();

        emit(ToDoLoadSuccess(
          todos: data,
          isInitialLoad: false, // Indicate it's the initial load
        ));
      } catch (e) {
        emit(ToDoOperationFailure());
      }
    });
    on<UpdateToDoStatusRequested>((event, emit) async {
      try {
        await toDoRepository.updateToDoStatus(event.todoId, event.newStatus);
        final data = await toDoRepository.getToDoList();

        emit(ToDoLoadSuccess(
          todos: data,
          isInitialLoad: false, // Indicate it's the initial load
        ));
      } catch (e) {
        emit(ToDoOperationFailure());
      }
    });

    on<PermanentDeleteToDoRequested>((event, emit) async {
      try {
        await toDoRepository.permanentDeleteToDo(event.todoId);
        final data = await toDoRepository.getToDoList();

        emit(ToDoLoadSuccess(
          todos: data,
          isInitialLoad: false, // Indicate it's the initial load
        ));
      } catch (e) {
        emit(ToDoOperationFailure());
      }
    });
  }
}
