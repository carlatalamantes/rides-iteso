import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rides_iteso/bloc/user/user.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserCar()) {
    on<UserCarRequested>((event, emit) async {
      emit(Loading());
      try {
        await UserC().getUserCar();
        emit(UserCar());
      } catch (e) {
        emit(UserCarError(e.toString()));
      }
    });

    on<CreateUserCarRequested>((event, emit) async {
      emit(Loading());
      try {
        await UserC().createUserCar(
          carModel: event.carModel,
          carColor: event.carColor,
          carPlate: event.carPlate,
          carYear: event.carYear,
          carBrand: event.carBrand,
        );
        emit(CreateUserCar());
      } catch (e) {
        emit(CreateUserCarError(e.toString()));
      }
    });
  }
}
