import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/data/datasources/todo_firebase_services.dart';
import 'package:flutter_application_1/features/home/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoFirebaseServices todoFirebaseServices;

  TodoRepositoryImpl(this.todoFirebaseServices);

  @override
  Stream<Either<Failure, QuerySnapshot>> getTodos() async* {
    try {
      yield* todoFirebaseServices.getTodos().map((snapshot) => right(snapshot));
    } catch (e) {
      yield left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTodo(
      String title, int priority, bool isDone, Timestamp date) async {
    try {
      await todoFirebaseServices.addTodo(title, priority, isDone, date);
      return right(null);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> editTodo(
      String id, String title, int priority, bool isDone, DateTime date) async {
    try {
      await todoFirebaseServices.editTodo(id, title, priority, isDone, date);
      return right(null);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      await todoFirebaseServices.deleteTodo(id);
      return right(null);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> toggleIsDone(String id, bool isDone) async {
    try {
      await todoFirebaseServices.toggleIsDone(id, isDone);
      return right(null);
    } catch (e) {
      return left(CacheFailure());
    }
  }
}
