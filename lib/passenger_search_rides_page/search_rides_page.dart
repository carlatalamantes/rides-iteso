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
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay,
                          availableCalendarFormats: const {
                            CalendarFormat.month: 'Month'
                          },
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            // Use `selectedDayPredicate` to determine which day is currently selected.
                            // If this returns true, then `day` will be marked as selected.

                            // Using `isSameDay` is recommended to disregard
                            // the time-part of compared DateTime objects.
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              // Call `setState()` when updating the selected day
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                        ),
                        base_TextFormField(
                          textController: zoneController,
                          labelText: 'Zona',
                          isRequired: true,
                        ),
                        base_ElevatedButton(
                          text: 'Buscar Ride',
                          backgroundColor: const Color(0xFF064789),
                          onPressed: () {
                            buscarRide();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.routesSearch.length,
                          itemBuilder: (context, index) {
                            return SearchCard(
                                ride: state.routesSearch[index], index: index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }

  buscarRide() {
    print(_focusedDay);
    print(zoneController.text);
    /*
    emitir evento
    */
  }
}
