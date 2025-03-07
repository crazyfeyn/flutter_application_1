part of 'home_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.getTodos() = _GetTodos;
  const factory TodoEvent.addTodo(
      String title, int priority, bool isDone, Timestamp date) = _AddTodo;
  const factory TodoEvent.editTodo(
          String id, String title, int priority, bool isDone, DateTime date) =
      _EditTodo;
  const factory TodoEvent.deleteTodo(String id) = _DeleteTodo;
  const factory TodoEvent.toggleIsDone(String id, bool isDone) = _ToggleIsDone;
}
