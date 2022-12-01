part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class Loading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserCar extends UserState {
  @override
  List<Object?> get props => [];
}

class UserCarError extends UserState {
  final String error;

  UserCarError(this.error);
  @override
  List<Object?> get props => [error];
}

//Adding car to user collection
class CreateUserCar extends UserState {
  @override
  List<Object?> get props => [];
}

class CreateUserCarError extends UserState {
  final String error;
  CreateUserCarError(this.error);
  @override
  List<Object?> get props => [error];
}

//Adding role to user collection
class CreateUserRole extends UserState {
  final String role;
  CreateUserRole(this.role);
  @override
  List<Object?> get props => [role];
}

class CreateUserRoleError extends UserState {
  final String error;
  CreateUserRoleError(this.error);
  @override
  List<Object?> get props => [error];
}

//Adding origin and destination to user collection
class CreateOriginDestination extends UserState {
  final String origin;
  final String destination;
  CreateOriginDestination(this.origin, this.destination);
  @override
  List<Object?> get props => [origin, destination];
}

class CreateOriginDestinationError extends UserState {
  final String error;
  CreateOriginDestinationError(this.error);
  @override
  List<Object?> get props => [error];
}
