import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/passenger/passenger_bloc.dart';

class PassengerCard extends StatelessWidget {
  const PassengerCard({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final Map<String, dynamic> ride;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: BlocConsumer<PassengerBloc, PassengerState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          "De: ${ride['origin']}",
                          style: const TextStyle(
                            color: Color(0xFF064789),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.person,
                          color: Color(0xFF064789),
                          size: 30,
                        ),
                        Text(
                          "${ride['passengers'].length}/${ride['maxPassengers']}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Hacia: ${ride['destination']}",
                          style: const TextStyle(
                            color: Color(0xFF064789),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${ride['dateList']}:${ride['dateList']}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<PassengerBloc>(context)
                                .add(LeaveRouteRequested(ride['id']));
                          },
                          child: const Text(
                            "Leave",
                            style: TextStyle(color: Color(0xFF064789)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
