part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Create route
class CreateRouteRequested extends RoutesEvent {
  final DateTime datetime;

  CreateRouteRequested(this.datetime);
}

//Get routes
class GetRoutesRequested extends RoutesEvent {
  GetRoutesRequested();
}
