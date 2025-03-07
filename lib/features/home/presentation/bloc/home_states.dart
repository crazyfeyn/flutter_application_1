import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/constants/app_constants.dart';

class HomeState {
  final Status status;
  final QuerySnapshot? todos;

  HomeState({this.status = Status.initial, this.todos});

  HomeState copyWith({Status? status, QuerySnapshot? todos}) {
    return HomeState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }
}
