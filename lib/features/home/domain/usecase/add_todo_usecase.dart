import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/domain/repositories/todo_repository.dart';

class AddTodoUsecase {
  final TodoRepository todoRepository;
  AddTodoUsecase({required this.todoRepository});
  Future<Either<Failure, void>> call(
      String title, int priority, bool isDone, Timestamp date) {
    return todoRepository.addTodo(title, priority, isDone, date);
  }
}
