part of 'passenger_bloc.dart';

abstract class PassengerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Get routes that the user is in
class GetJoinedRoutesRequested extends PassengerEvent {
  GetJoinedRoutesRequested();
}

//Get routes that the user is not in
class GetRoutesSearchRequested extends PassengerEvent {
  GetRoutesSearchRequested();
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
