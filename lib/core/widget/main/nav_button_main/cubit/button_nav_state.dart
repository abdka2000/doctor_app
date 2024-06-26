import 'package:equatable/equatable.dart';

class ButtonNavBarState extends Equatable {
  final int buttonNavBarIndex;
  const ButtonNavBarState({required this.buttonNavBarIndex});
  factory ButtonNavBarState.intial() {
    return const ButtonNavBarState(
      buttonNavBarIndex: 2,
    );
  }
  @override
  List<Object?> get props => [buttonNavBarIndex];

  ButtonNavBarState copyWith({
    int? buttonNavBarIndex,
  }) {
    return ButtonNavBarState(
      buttonNavBarIndex: buttonNavBarIndex ?? this.buttonNavBarIndex,
    );
  }
}
