part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Create route
class CreateRouteRequested extends RoutesEvent {
  final List<DateTime> dateList;

  CreateRouteRequested(this.dateList);
}

//Get routes
class GetRoutesRequested extends RoutesEvent {
  final bool getFutureRoutes;
  GetRoutesRequested(this.getFutureRoutes);
}

//Delete route+
class DeleteRouteRequested extends RoutesEvent {
  final String routeId;
  DeleteRouteRequested(this.routeId);
}
