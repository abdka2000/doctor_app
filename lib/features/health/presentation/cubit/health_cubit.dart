import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  HealthCubit() : super(HealthInitial());
}
