import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rides_iteso/bloc/routes/routes.dart';
part 'routes_state.dart';
part 'routes_event.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  List<dynamic> routes = [];
  RoutesBloc() : super(Routes()) {
    on<CreateRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await RoutesC().createRoute(
          dateList: event.dateList,
        );
        emit(CreateRoute());
      } catch (e) {
        emit(CreateRouteError(e.toString()));
      }
    });

    on<GetRoutesRequested>((event, emit) async {
      emit(Loading());
      try {
        final routes = await RoutesC().getRoutes(event.getFutureRoutes);
        emit(GetRoutes(routes));
      } catch (e) {
        emit(GetRoutesError(e.toString()));
      }
    });

    on<DeleteRouteRequested>((event, emit) async {
      emit(Loading());
      try {
        await RoutesC().deleteRoute(event.routeId);
        emit(DeleteRoute());
      } catch (e) {
        emit(DeleteRouteError(e.toString()));
      }
    });
  }
}
