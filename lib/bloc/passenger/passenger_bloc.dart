import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rides_iteso/bloc/passenger/passenger.dart';
part 'passenger_state.dart';
part 'passenger_event.dart';

class RoutesBloc extends Bloc<PassengerEvent, PassengerState> {
  List<dynamic> routes = [];
  RoutesBloc() : super(Routes()) {
    on<GetRoutesRequested>((event, emit) async {
      emit(Loading());
      try {
        final routes = await PassengerC().getRoutes();
        emit(GetRoutes(routes));
      } catch (e) {
        emit(GetRoutesError(e.toString()));
      }
    });

    on<JoinRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await PassengerC().joinRoute(event.routeId);
        emit(JoinRoute());
      } catch (e) {
        emit(JoinRouteError(e.toString()));
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