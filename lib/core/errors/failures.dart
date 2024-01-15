import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
}

class Exception extends Failure {
  final String message;
  const Exception({required this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class ServerException extends Failure {
  final String message;
  const ServerException({required this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class CacheException extends Failure {
  final String message;
  const CacheException({required this.message}) : super(message: message);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
