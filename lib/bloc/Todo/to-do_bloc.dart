import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/Todo/to-do_event.dart';
import 'package:todo/repo/to-do_repo.dart';
import 'to-do_state.dart';

class ToDoBloc extends Bloc<ToDOEvent, ToDoState> {
  final ToDoRepository toDoRepository;
  ToDoBloc({required this.toDoRepository}) : super(InitialState()) {
    on<AddToDoRequested>((event, emit) async {
      emit(ToDoAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await toDoRepository.create(
            title: event.title,
            description: event.description,
            status: event.status,
            tags: event.tags,
            date: event.date);
        final data = await ToDoRepository().get();
        emit(ToDoAdded());
        emit(ToDoLoaded(data));
      } catch (e) {
        emit(ToDoError(e.toString()));
      }
    });

    on<GetData>((event, emit) async {
      emit(ToDoLoading());
      try {
        final data = await ToDoRepository().get();
        emit(ToDoLoaded(data));
      } catch (e) {
        FlutterError.reportError(FlutterErrorDetails(exception: e));
        emit(ToDoError(e.toString()));
      }
    });

    on<DeleteToDoRequested>((event, emit) async {
      emit(ToDoDeleting());
      try {
        await toDoRepository.delete(event.todoId);
        final data = await ToDoRepository().get();

        emit(ToDoLoaded(data));
        emit(ToDoLoaded(data));
      } catch (e) {
        emit(ToDoError(e.toString()));
      }
    });
    on<UpdateToDoStatusRequested>((event, emit) async {
      emit(ToDoUpdating());
      try {
        await toDoRepository.updateStatus(event.todoId, event.newStatus);
        final data = await ToDoRepository().get();

        emit(ToDoLoaded(data));
      } catch (e) {
        emit(ToDoError(e.toString()));
      }
    });

    on<PermanentDeleteToDoRequested>((event, emit) async {
      emit(PermanentDeleting());
      try {
        await toDoRepository.permanentDelete(event.todoId);
        final data = await toDoRepository.get();
        emit(PermanetDeleted(data));
        emit(ToDoLoaded(data));
      } catch (e) {
        emit(ToDoError(e.toString()));
      }
    });
  }
}
