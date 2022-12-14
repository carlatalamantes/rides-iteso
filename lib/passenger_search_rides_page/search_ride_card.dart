import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/passenger/passenger_bloc.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.ride,
    required this.index,
  }) : super(key: key);

  final Map<String, dynamic> ride;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<PassengerBloc, PassengerState>(
          listener: (context, state) {},
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
                    Row(
                      children: [
                        Text(
                          "Incia en: ${ride['origin']}",
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
                    Text(
                      "destino: ${ride['destination']}",
                      style: const TextStyle(
                        color: Color(0xFF064789),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${ride['car']['brand']} ${ride['car']['model']} - ${ride['car']['color']} - ${ride['car']['plate']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          "${ride['dateList'].toDate().day}/${ride['dateList'].toDate().month}/${ride['dateList'].toDate().year}",
                          style: const TextStyle(color: Color(0xFF064789)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          child: const Text(
                            "Unirme al ride",
                            style: TextStyle(color: Color(0xFF064789)),
                          ),
                          onTap: () {
                            BlocProvider.of<PassengerBloc>(context)
                                .add(JoinRouteRequested(ride['id']));
                          },
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
