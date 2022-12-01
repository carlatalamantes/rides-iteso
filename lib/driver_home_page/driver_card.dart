import 'dart:math';

import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.ride,
  }) : super(key: key);

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
              SizedBox(height:25),
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
              SizedBox(height:10),
              Text(
                "Hacia: ${ride['to']}",
                style: const TextStyle(
                  color: Color(0xFF064789),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Spacer(),
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
