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
      padding: const EdgeInsets.only(top:5, bottom: 5),
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
              Row(
                children: [
                  Text(
                    "${ride['location']}",
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
              Text(
                "${ride['time']}",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Row(children: days(ride['day']),),
                  const Spacer(),
                  const Text(
                    "Editar",
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

  List<Widget> days(List<int>days) {
    List<Widget> ret = [
      _Buton(tag: 'L', act: days[0]==1),
      _Buton(tag: 'M', act: days[1]==1),
      _Buton(tag: 'M', act: days[2]==1),
      _Buton(tag: 'J', act: days[3]==1),
      _Buton(tag: 'V', act: days[4]==1),
      _Buton(tag: 'D', act: days[5]==1),
    ];
    return ret;
  }
}

class _Buton extends StatelessWidget {
  const _Buton({required this.tag, required this.act});
  final String tag;
  final bool act;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: (act) ? const Color(0xFF064789) : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Spacer(),
          Text(
            tag,
            style: TextStyle(
              color: (act) ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
