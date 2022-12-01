import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rides_iteso/bloc/routes/routes.dart';
part 'routes_state.dart';
part 'routes_event.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(Routes()) {
    on<CreateRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await RoutesC().createRoute(
          dateList: event.dateList,
          time: event.time,
        );
        emit(CreateRoute());
      } catch (e) {
        emit(CreateRouteError(e.toString()));
      }
    });

    on<GetRoutesRequested>((event, emit) async {
      emit(Loading());
      try {
        final routes = await RoutesC().getRoutes();
        emit(GetRoutes(routes));
      } catch (e) {
        emit(GetRoutesError(e.toString()));
      }
    });
  }
}
