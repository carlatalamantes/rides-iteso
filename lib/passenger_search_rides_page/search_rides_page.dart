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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PassengerBloc>(context).add(GetRoutesRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: BlocConsumer<PassengerBloc, PassengerState>(
          listener: (context, state) {},
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
                    /*   const Center(
                      child: Text(
                        'Rides',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ), */
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          state.routes.length, //state.searchedRoutes.length,
                      itemBuilder: (context, index) {
                        print(state.routes);
                        return SearchCard(
                            ride: state.routes[index], index: index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  buscarRide() {
    print(_focusedDay);
    print(zoneController.text);
    /*
    emitir evento
    */
  }
}





/*
import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_DropdownButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class CarRegisterPage extends StatelessWidget {
  const CarRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConductorCarPage(context),
        ),
      ),
    );
  }

  Widget ConductorCarPage(BuildContext context) {
    var anioTextController = TextEditingController();
    String marcaTextController = "Value 1";
    var modeloTextController = "Value 1";
    var colorTextController = "Value 1";
    var pasajerosTextController = TextEditingController();

    var items = [
      {"value": "Value 1", "label": "Label 1"},
      {"value": "Value 2", "label": "Label 2"},
      {"value": "Value 3", "label": "Label 3"},
      {"value": "Value 4", "label": "Label 4"},
      {"value": "Value 5", "label": "Label 5"},
    ];

    guardarButton(BuildContext context) {}

    return Column(
      children: [
        base_TextFormField(
          nombreTextController: anioTextController,
          labelText: 'Año',
        ),
        base_DropdownButton(
          dropdownValue: marcaTextController,
          items: items,
          labelText: 'Marca',
          selectedIndex: 0,
        ),
        base_DropdownButton(
          dropdownValue: modeloTextController,
          items: items,
          labelText: 'Modelo',
          selectedIndex: 0,
        ),
        base_DropdownButton(
          dropdownValue: colorTextController,
          items: items,
          labelText: 'Color',
          selectedIndex: 0,
        ),
        base_TextFormField(
          nombreTextController: pasajerosTextController,
          labelText: 'Pasajeros que puedo transportar',
        ),
        const SizedBox(
          height: 10,
        ),
        base_DropdownButton(
          dropdownValue: colorTextController,
          items: items,
          labelText: 'Zonas de drop off',
          selectedIndex: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF064789)),
            onPressed: () {
              guardarButton(context);
            },
            child: const Text('GUARDAR'),
          ),
        ),
      ],
    );
  }
}
*/