import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  @override
  List<Object> get props => [message];

  const Failure({String? message}) : message = message ?? '';
}

class ServiceFailure extends Failure {}

class ServerFailure extends Failure {}

class NotFoundEntity extends Failure {}

class InvalidModel extends Failure {}

class FailedCreateEntity extends Failure {}

class FailedEditEntity extends Failure {}
