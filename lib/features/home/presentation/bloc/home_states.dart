part of 'home_bloc.dart';

enum TodoStatus { initial, loading, success, error }

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(TodoStatus.initial) TodoStatus status,
    QuerySnapshot? todos,
  }) = _TodoState;
}
