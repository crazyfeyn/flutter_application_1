import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/home/domain/repositories/todo_repository.dart';

class EditTodosUsecase {
  TodoRepository todoRepository;
  EditTodosUsecase({
    required this.todoRepository,
  });
  Future<Either<Failure, void>> call(
      String id, String title, int priority, bool isDone, DateTime date) {
    return todoRepository.editTodo(id, title, priority, isDone, date);
  }
}
