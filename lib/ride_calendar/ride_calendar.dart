import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                availableCalendarFormats: {CalendarFormat.month: 'Month'},
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
                    setState(() {
                    });
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
                        child: Text(
                          "$text",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                  },
                ),
              ),
              base_ElevatedButton(
                text: 'Guardar', //boton que cambia de color dependiendo
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  saveButton(context);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }


  saveButton(BuildContext context) {
    print("se guardaron las fechas");
    Navigator.pop(context);
  }

  bool checkIfItExist(DateTime date){

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
