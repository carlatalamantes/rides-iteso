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
