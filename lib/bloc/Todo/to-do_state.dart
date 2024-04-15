import 'package:equatable/equatable.dart';
import 'package:todo/model/to-do.dart';

abstract class ToDoState extends Equatable {}

class ToDoLoading extends ToDoState {
  @override
  List<Object?> get props => [];
}

class ToDoLoadSuccess extends ToDoState {
  final List<Todo> todos;

  ToDoLoadSuccess({required this.todos});
  @override
  List<Object?> get props => [todos];
}

class ToDoOperationFailure extends ToDoState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ToDoAdding extends ToDoState {
  @override
  List<Object?> get props => [];
}

class ToDoAdded extends ToDoState {
  @override
  List<Object?> get props => [];
}

// class ToDoError extends ToDoState {
//   final String error;
//   ToDoError(this.error);

//   @override
//   List<Object?> get props => [];
// }

// class ToDoLoading extends ToDoState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

// class ToDoLoaded extends ToDoState {
//   List<Todo> myData;
//   ToDoLoaded(this.myData);

//   @override
//   // TODO: implement props
//   List<Object?> get props => [myData];
// }

// class ToDoDeleting extends ToDoState {
//   @override
//   List<Object?> get props => [];
// }

// class ToDoDeleted extends ToDoState {
//   List<Todo> myData;
//   ToDoDeleted(this.myData);

//   @override
//   // TODO: implement props
//   List<Object?> get props => [myData];
// }

// class ToDoUpdating extends ToDoState {
//   @override
//   List<Object?> get props => [];
// }

// class ToDoUpdated extends ToDoState {
//   List<Todo> myData;
//   ToDoUpdated(this.myData);

//   @override
//   // TODO: implement props
//   List<Object?> get props => [myData];
// }

// class PermanentDeleting extends ToDoState {
//   @override
//   List<Object?> get props => [];
// }

// class PermanetDeleted extends ToDoState {
//   List<Todo> myData;
//   PermanetDeleted(this.myData);

//   @override
//   // TODO: implement props
//   List<Object?> get props => [myData];
// }
