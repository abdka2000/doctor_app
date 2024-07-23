part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final Person person;

  const ProfileState({
    required this.person,
    required this.status,
    required this.failureMessage,
  });

  factory ProfileState.initial() {
    return ProfileState(
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
      person: Person(
          id: 0,
          fullName: '',
          birthDate: DateTime.now(),
          phoneNumber: '0000000000',
          gender: 0),
    );
  }

  @override
  List<Object> get props => [failureMessage, status, person];

  ProfileState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    Person? person,
  }) {
    return ProfileState(
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
      person: person ?? this.person,
    );
  }
}
