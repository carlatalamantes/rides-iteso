import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/passenger/passenger_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/passenger_search_rides_page/search_ride_card.dart';
import 'package:table_calendar/table_calendar.dart';

class SearchRidesPage extends StatefulWidget {
  SearchRidesPage({super.key});

  @override
  State<SearchRidesPage> createState() => _SearchRidesPageState();
}

class _SearchRidesPageState extends State<SearchRidesPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var zoneController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PassengerBloc>(context).add(GetRoutesSearchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0.0,
            ),
            body: BlocConsumer<PassengerBloc, PassengerState>(
              listener: (context, state) {
                print(state.routesSearch);
                if (state is JoinRouteError) {
                  scaffoldMessengerKey.currentState?.showSnackBar(
                    const SnackBar(
                      content: Text("Error al unirse a la ruta"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.routes.isEmpty) {
                  return const Center(
                    child: Text("No hay rutas disponibles para el día de hoy"),
                  );
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.routesSearch.length,
                            itemBuilder: (context, index) {
                              return SearchCard(
                                  ride: state.routesSearch[index],
                                  index: index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            )));
  }
}
