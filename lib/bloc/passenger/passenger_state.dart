part of 'passenger_bloc.dart';

abstract class PassengerState extends Equatable {
  PassengerState();
  List<dynamic> routes = [];
  List<dynamic> routesSearch = [];
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

// Getting routes
class GetSearchRoutes extends PassengerState {
  final List<dynamic> routesSearch;
  GetSearchRoutes(this.routesSearch);
  @override
  List<Object?> get props => [routesSearch];
}

class GetRoutesError extends PassengerState {
  final String error;
  GetRoutesError(this.error);
  @override
  List<Object?> get props => [error];
}

//Get routes that the user is in
class GetJoinedRoutes extends PassengerState {
  final List<dynamic> routes;
  GetJoinedRoutes(this.routes);
  @override
  List<Object?> get props => [routes];
}

class GetJoinedRoutesError extends PassengerState {
  final String error;
  GetJoinedRoutesError(this.error);
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
