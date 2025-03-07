import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/domain/repositories/todo_repository.dart';

class DeleteTodoUsecase {
  TodoRepository todoRepository;
  DeleteTodoUsecase({
    required this.todoRepository,
  });
  Future<Either<Failure, void>> call(String id) {
    return todoRepository.deleteTodo(id);
  }
}
