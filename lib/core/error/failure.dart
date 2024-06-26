import 'package:equatable/equatable.dart';
import '../entity/error_entity_response.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final ErrorResponseEntity response;
  ServerFailure({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
