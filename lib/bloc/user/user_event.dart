part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//User car
class UserCarRequested extends UserEvent {
  UserCarRequested();
}

//Create user car
class CreateUserCarRequested extends UserEvent {
  final String carModel;
  final String carYear;
  final String carColor;
  final String carPlate;
  final String carBrand;

  CreateUserCarRequested(
      this.carModel, this.carYear, this.carColor, this.carPlate, this.carBrand);
}
