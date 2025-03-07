import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';

abstract class TodoRepository {
  Stream<Either<Failure, QuerySnapshot>> getTodos();
  Future<Either<Failure, void>> addTodo(
      String title, int priority, bool isDone, Timestamp date);
  Future<Either<Failure, void>> editTodo(
      String id, String title, int priority, bool isDone, DateTime date);
  Future<Either<Failure, void>> deleteTodo(String id);
  Future<Either<Failure, void>> toggleIsDone(String id, bool isDone);
}
