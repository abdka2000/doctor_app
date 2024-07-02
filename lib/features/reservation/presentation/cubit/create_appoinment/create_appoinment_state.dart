part of 'create_appoinment_cubit.dart';

class CreateAppoinmentState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;

  const CreateAppoinmentState({
    required this.status,
    required this.failureMessage,
  });

  factory CreateAppoinmentState.initial() {
    return CreateAppoinmentState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  @override
  List<Object> get props => [failureMessage, status];

  CreateAppoinmentState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return CreateAppoinmentState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
