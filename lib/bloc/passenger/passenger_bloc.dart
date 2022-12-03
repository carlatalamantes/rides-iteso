import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rides_iteso/bloc/passenger/passenger.dart';
part 'passenger_state.dart';
part 'passenger_event.dart';

class PassengerBloc extends Bloc<PassengerEvent, PassengerState> {
  List<dynamic> routes = [];
  List<dynamic> searchRoutes = [];

  PassengerBloc() : super(Routes()) {
    on<GetRoutesSearchRequested>((event, emit) async {
      emit(Loading());
      try {
        final searchRoutes = await PassengerC().getRoutes();
        emit(GetSearchRoutes(searchRoutes));
      } catch (e) {
        emit(GetRoutesSearchError(e.toString()));
      }
    });

    on<GetJoinedRoutesRequested>((event, emit) async {
      emit(Loading());
      try {
        final routes = await PassengerC().getJoinedRoutes();
        emit(GetJoinedRoutes(routes));
      } catch (e) {
        emit(GetJoinedRoutesError(e.toString()));
      }
    });

    on<JoinRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await PassengerC().joinRoute(event.routeId);
        emit(JoinRoute());
      } catch (e) {
        emit(JoinRouteError("Route is full"));
      }
    });

    on<LeaveRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await PassengerC().leaveRoute(event.routeId);
        emit(LeaveRoute());
      } catch (e) {
        emit(LeaveRouteError(e.toString()));
      }
    });
  }
}
