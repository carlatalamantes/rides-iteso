part of 'routes_bloc.dart';

abstract class RoutesState extends Equatable {
  RoutesState();

  List<dynamic> routes = [];
}

class Loading extends RoutesState {
  @override
  List<Object?> get props => [];
}

class Routes extends RoutesState {
  @override
  List<Object?> get props => [];
}

// Creating routes
class CreateRoute extends RoutesState {
  @override
  List<Object?> get props => [];
}

class CreateRouteError extends RoutesState {
  final String error;
  CreateRouteError(this.error);
  @override
  List<Object?> get props => [error];
}

// Getting routes
class GetRoutes extends RoutesState {
  final List<dynamic> routes;
  GetRoutes(this.routes);
  @override
  List<Object?> get props => [routes];
}

class GetRoutesError extends RoutesState {
  final String error;
  GetRoutesError(this.error);
  @override
  List<Object?> get props => [error];
}

//Deleting routes
class DeleteRoute extends RoutesState {
  @override
  List<Object?> get props => [];
}

class DeleteRouteError extends RoutesState {
  final String error;
  DeleteRouteError(this.error);
  @override
  List<Object?> get props => [error];
}
