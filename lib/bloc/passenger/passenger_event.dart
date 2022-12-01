part of 'passenger_bloc.dart';

abstract class PassengerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Get routes
class GetRoutesRequested extends PassengerEvent {
  GetRoutesRequested();
}

//Join route
class JoinRouteRequested extends PassengerEvent {
  final String routeId;
  JoinRouteRequested(this.routeId);
}

//Leave route
class LeaveRouteRequested extends PassengerEvent {
  final String routeId;
  LeaveRouteRequested(this.routeId);
}

//Search routes
class SearchRoutesRequested extends PassengerEvent {
  final String searchQuery;
  SearchRoutesRequested(this.searchQuery);
}
