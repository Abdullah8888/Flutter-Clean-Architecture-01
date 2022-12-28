import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   const Failure([List properties = const <dynamic>[]]);
// }

abstract class Failure extends Equatable {
  final List? properties = const <dynamic>[];

// If the subclasses have some properties, they’ll get passed to this constructor

// so that Equatable can perform value comparison.

  @override
  List<Object?> get props => [properties];
}

class HttpFailure extends Failure implements HttpException {
  final String messages;

  HttpFailure(this.messages);

  @override

// TODO: implement message

  String get message => messages;
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case

// doesn’t accept any parameters.

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
