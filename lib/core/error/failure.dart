// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {}

class ServerFailure extends Failure {
  String message;
  ServerFailure({
    required this.message,
  });
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}
