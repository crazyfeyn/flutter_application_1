import 'package:flutter_application_1/features/home/data/datasources/todo_firebase_services.dart';
import 'package:flutter_application_1/features/home/data/repositories/todo_repository.dart';
import 'package:flutter_application_1/features/home/domain/usecase/add_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/edit_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/get_todo_usecase.dart';
import 'package:flutter_application_1/features/home/domain/usecase/toggle_is_done_todo_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  sl.registerFactory(() => TodoFirebaseServices());

  sl.registerFactory(() => TodoRepositoryImpl(
        sl<TodoFirebaseServices>(),
      ));
  sl.registerFactory(
      () => AddTodoUsecase(todoRepository: sl<TodoRepositoryImpl>()));
  sl.registerFactory(
      () => DeleteTodoUsecase(todoRepository: sl<TodoRepositoryImpl>()));
  sl.registerFactory(
      () => EditTodosUsecase(todoRepository: sl<TodoRepositoryImpl>()));
  sl.registerFactory(
      () => GetTodosUsecase(todoRepository: sl<TodoRepositoryImpl>()));
  sl.registerFactory(
      () => ToggleIsDoneTodoUsecase(todoRepository: sl<TodoRepositoryImpl>()));
}
