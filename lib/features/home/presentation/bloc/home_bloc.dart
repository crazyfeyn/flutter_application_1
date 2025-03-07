// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/constants/app_constants.dart';
import 'package:flutter_application_1/features/home/domain/usecase/add_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/edit_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/get_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/toggle_is_done_todo_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/error/failure.dart';

part 'home_bloc.freezed.dart';
part 'home_events.dart';
part 'home_states.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final EditTodosUsecase editTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  final ToggleIsDoneTodoUsecase toggleIsDoneUsecase;

  TodoBloc(
    this.getTodosUsecase,
    this.addTodoUsecase,
    this.editTodoUsecase,
    this.deleteTodoUsecase,
    this.toggleIsDoneUsecase,
  ) : super(TodoState()) {
    on<_LoadTodos>(_loadTodos);
    on<_AddTodo>(_addTodo);
    on<_EditTodo>(_editTodo);
    on<_DeleteTodo>(_deleteTodo);
    on<_ToggleIsDone>(_toggleIsDone);
  }

  Future<void> _loadTodos(_LoadTodos event, Emitter<TodoState> emit) async {
    // emit(state.copyWith(status: Status.loading));
    // try {
    //   final stream = getTodosUsecase();
    //   await emit.forEach(stream,
    //       onData: (Either<Failure, QuerySnapshot> result) {
    //     return result.fold(
    //       (failure) => state.copyWith(status: Status.error),
    //       (todos) => state.copyWith(status: Status.success, todos: todos),
    //     );
    //   });
    // } catch (e) {
    //   emit(state.copyWith(status: Status.error));
    // }
  }

  Future<void> _addTodo(_AddTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: Status.loading));
    // final response = await addTodoUsecase(
    //     event.title, event.priority, event.isDone, event.date);
    // response.fold(
    //   (failure) => emit(state.copyWith(status: Status.error)),
    //   (_) => emit(state.copyWith(status: Status.success)),
    // );
  }

  Future<void> _editTodo(_EditTodo event, Emitter<TodoState> emit) async {
    // emit(state.copyWith(status: Status.loading));
    // final response = await editTodoUsecase(
    //     event.id, event.title, event.priority, event.isDone, event.date);
    // response.fold(
    //   (failure) => emit(state.copyWith(status: Status.error)),
    //   (_) => emit(state.copyWith(status: Status.success)),
    // );
  }

  Future<void> _deleteTodo(_DeleteTodo event, Emitter<TodoState> emit) async {
    // emit(state.copyWith(status: Status.loading));
    // final response = await deleteTodoUsecase(event.id);
    // response.fold(
    //   (failure) => emit(state.copyWith(status: Status.error)),
    //   (_) => emit(state.copyWith(status: Status.success)),
    // );
  }

  Future<void> _toggleIsDone(
      _ToggleIsDone event, Emitter<TodoState> emit) async {
    // emit(state.copyWith(status: Status.loading));
    // final response = await toggleIsDoneUsecase(event.id, event.isDone);
    // response.fold(
    //   (failure) => emit(state.copyWith(status: Status.error)),
    //   (_) => emit(state.copyWith(status: Status.success)),
    // );
  }
}
