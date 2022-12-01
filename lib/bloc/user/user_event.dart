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
  final String numPas;
  final String carPlate;
  final String carBrand;

  CreateUserCarRequested(
    this.carPlate,
    this.carBrand,
    this.carModel,
    this.carColor,
    this.carYear,
    this.numPas,
  );
}

class CreateUserRoleRequested extends UserEvent {
  final String role;

  CreateUserRoleRequested(this.role);
}

class CreateOriginDestinationRequested extends UserEvent {
  final String origin;
  final String destination;

  CreateOriginDestinationRequested(this.origin, this.destination);
}
