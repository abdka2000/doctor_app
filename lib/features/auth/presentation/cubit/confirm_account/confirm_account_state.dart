import 'package:equatable/equatable.dart';
import '../../../../../core/function/maping_falure.dart';
import '../../../../../core/resources/enum_manger.dart';

class ConfirmAccountState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  const ConfirmAccountState({
    required this.failureMessage,
    required this.status,
  });

  factory ConfirmAccountState.intial() {
    return ConfirmAccountState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }
  @override
  List<Object?> get props => [failureMessage, status];

  ConfirmAccountState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return ConfirmAccountState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }
}
