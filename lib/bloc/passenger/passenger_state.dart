part of 'passenger_bloc.dart';

abstract class PassengerState extends Equatable {
  PassengerState();
  List<dynamic> routes = [];
}

class Loading extends PassengerState {
  @override
  List<Object?> get props => [];
}

class Routes extends PassengerState {
  @override
  List<Object?> get props => [];
}

// Getting routes
class GetRoutes extends PassengerState {
  final List<dynamic> routes;
  GetRoutes(this.routes);
  @override
  List<Object?> get props => [routes];
}

class GetRoutesError extends PassengerState {
  final String error;
  GetRoutesError(this.error);
  @override
  List<Object?> get props => [error];
}

//Joining routes
class JoinRoute extends PassengerState {
  @override
  List<Object?> get props => [];
}

class JoinRouteError extends PassengerState {
  final String error;
  JoinRouteError(this.error);
  @override
  List<Object?> get props => [error];
}

//Leaving routes
class LeaveRoute extends PassengerState {
  @override
  List<Object?> get props => [];
}

class LeaveRouteError extends PassengerState {
  final String error;
  LeaveRouteError(this.error);
  @override
  List<Object?> get props => [error];
}
