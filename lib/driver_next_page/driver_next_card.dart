import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';

class DriverNextCard extends StatelessWidget {
  const DriverNextCard({
    Key? key,
    required this.ride,
    required this.index,
  }) : super(key: key);

  final int index;
  final Map<String, dynamic> ride;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
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
              const SizedBox(height:25),
              Row(
                children: [
                  Text(
                    "De: ${ride['from']}",
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
                    "${ride['registererd']}/${ride['passengerLimit']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height:10),
              Row(
                children: [
                  Text(
                    "Hacia: ${ride['to']}",
                    style: const TextStyle(
                      color: Color(0xFF064789),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${ride['time']}",
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
                  Text(
                    "${ride['day']}",
                    style: TextStyle(color: Color(0xFF064789)),
                  ),
                  const Spacer(),
                  Text(
                    "Cancel",
                    style: TextStyle(color: Color(0xFF064789)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
