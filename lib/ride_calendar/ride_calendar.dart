import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/routes/routes_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:table_calendar/table_calendar.dart';

class RideCalendar extends StatefulWidget {
  const RideCalendar({super.key});

  @override
  State<RideCalendar> createState() => _RideCalendarState();
}

class _RideCalendarState extends State<RideCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<DateTime> dateList = [];
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<RoutesBloc, RoutesState>(
                listener: (context, state) {
                  if (state is CreateRouteError) {
                    scaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                      ),
                    );
                  }

                  if (state is CreateRoute) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => RideCalendar(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Image(
                            image: AssetImage('assets/images/logo_blue.png'),
                            height: 150,
                          ),
                        ),
                        TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          availableCalendarFormats: {
                            CalendarFormat.month: 'Month'
                          },
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
                              checkDateList(selectedDay);
                              setState(() {});
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                          calendarBuilders: CalendarBuilders(
                            defaultBuilder: (context, day, day2) {
                              if (checkIfItExist(day)) {
                                final text = day.day;
                                return Center(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF064789),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$text",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Text(
                          "${time.hour}:${time.minute}",
                          style: const TextStyle(
                            color: Color(0xFF064789),
                            fontSize: 30,
                          ),
                        ),
                        base_ElevatedButton(
                          text:
                              'Pick Time', //boton que cambia de color dependiendo
                          backgroundColor: const Color(0xFF064789),
                          onPressed: () async {
                            await pickTime(context);
                          },
                        ),
                        base_ElevatedButton(
                          text:
                              'Guardar', //boton que cambia de color dependiendo
                          backgroundColor: const Color(0xFF064789),
                          onPressed: () {
                            saveButton(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )),
        ));
  }

  pickTime(BuildContext context) async {
    TimeOfDay? tmp = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    setState(() {
      time = tmp ?? time;
    });
  }

  saveButton(BuildContext context) {
    BlocProvider.of<RoutesBloc>(context).add(
      CreateRouteRequested(
        dateList,
        time,
      ),
    );
  }

  bool checkIfItExist(DateTime date) {
    return dateList.contains(date);
  }

  checkDateList(DateTime date) {
    if (!dateList.contains(date)) {
      dateList.add(date);
    } else {
      dateList.remove(date);
    }
  }
}
