import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  Failure({required this.message});
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({String? message}) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure({String? message}) : super(message: message);
}

class RequestTimeout extends NetworkFailure {
  RequestTimeout({String? message}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({String? message}) : super(message: message);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({String? message}) : super(message: message);
}
