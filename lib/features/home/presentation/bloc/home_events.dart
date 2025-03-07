import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeEvent {}

class LoadTodos extends HomeEvent {}

class AddTodo extends HomeEvent {
  final String title;
  final int priority;
  final bool isDone;
  final Timestamp date;

  AddTodo(this.title, this.priority, this.isDone, this.date);
}

class EditTodo extends HomeEvent {
  final String id;
  final String title;
  final int priority;
  final bool isDone;
  final DateTime date;

  EditTodo(this.id, this.title, this.priority, this.isDone, this.date);
}

class DeleteTodo extends HomeEvent {
  final String id;

  DeleteTodo(this.id);
}

class ToggleIsDone extends HomeEvent {
  final String id;
  final bool isDone;

  ToggleIsDone(this.id, this.isDone);
}
