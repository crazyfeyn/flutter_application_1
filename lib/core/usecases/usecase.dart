import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
