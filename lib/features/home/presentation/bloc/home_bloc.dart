import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/constants/app_constants.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/domain/usecase/add_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/edit_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/get_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/toggle_is_done_todo_usecase.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_events.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final EditTodosUsecase editTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  final ToggleIsDoneTodoUsecase toggleIsDoneUsecase;

  HomeBloc(
    this.getTodosUsecase,
    this.addTodoUsecase,
    this.editTodoUsecase,
    this.deleteTodoUsecase,
    this.toggleIsDoneUsecase,
  ) : super(HomeState()) {
    on<LoadTodos>(_loadTodos);
    on<AddTodo>(_addTodo);
    on<EditTodo>(_editTodo);
    on<DeleteTodo>(_deleteTodo);
    on<ToggleIsDone>(_toggleIsDone);
  }

  Future<void> _loadTodos(LoadTodos event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final stream = getTodosUsecase();
      await emit.forEach(stream,
          onData: (Either<Failure, QuerySnapshot> result) {
        return result.fold(
          (failure) => state.copyWith(status: Status.error),
          (todos) => state.copyWith(status: Status.success, todos: todos),
        );
      });
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> _addTodo(AddTodo event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await addTodoUsecase(
        event.title, event.priority, event.isDone, event.date);
    response.fold(
      (failure) => emit(state.copyWith(status: Status.error)),
      (_) => emit(state.copyWith(status: Status.success)),
    );
  }

  Future<void> _editTodo(EditTodo event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await editTodoUsecase(
        event.id, event.title, event.priority, event.isDone, event.date);
    response.fold(
      (failure) => emit(state.copyWith(status: Status.error)),
      (_) => emit(state.copyWith(status: Status.success)),
    );
  }

  Future<void> _deleteTodo(DeleteTodo event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await deleteTodoUsecase(event.id);
    response.fold(
      (failure) => emit(state.copyWith(status: Status.error)),
      (_) => emit(state.copyWith(status: Status.success)),
    );
  }

  Future<void> _toggleIsDone(
      ToggleIsDone event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await toggleIsDoneUsecase(event.id, event.isDone);
    response.fold(
      (failure) => emit(state.copyWith(status: Status.error)),
      (_) => emit(state.copyWith(status: Status.success)),
    );
  }
}
