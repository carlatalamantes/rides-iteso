part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Create route
class CreateRouteRequested extends RoutesEvent {
  final TimeOfDay time;
  final List<DateTime> dateList;

  CreateRouteRequested(this.dateList, this.time);
}

//Get routes
class GetRoutesRequested extends RoutesEvent {
  GetRoutesRequested();
}
