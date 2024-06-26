import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';

class CreateAccountState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const CreateAccountState({
    required this.failureMessage,
    required this.status,
  });

  factory CreateAccountState.intial() {
    return CreateAccountState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  CreateAccountState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return CreateAccountState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
