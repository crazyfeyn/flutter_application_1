import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/domain/repositories/todo_repository.dart';

class GetTodosUsecase {
  TodoRepository todoRepository;
  GetTodosUsecase({
    required this.todoRepository,
  });
  Stream<Either<Failure, QuerySnapshot>> call() {
    return todoRepository.getTodos();
  }
}
