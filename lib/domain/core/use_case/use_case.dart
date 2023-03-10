import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:places/domain/core/error/failure.dart';

// ignore: one_member_abstracts
abstract class UseCase<ReturnType, Args> {
  Future<Either<Failure, ReturnType>> call(Args args);
}

class NoArgs extends Equatable {
  @override
  List<Object> get props => [];
}