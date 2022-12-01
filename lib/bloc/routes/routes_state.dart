part of 'routes_bloc.dart';

abstract class RoutesState extends Equatable {
  const RoutesState();
}

class Loading extends RoutesState {
  @override
  List<Object?> get props => [];
}

class Routes extends RoutesState {
  @override
  List<Object?> get props => [];
}

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
