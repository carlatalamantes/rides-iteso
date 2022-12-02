import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final Map<String, dynamic> ride;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                    "${ride['name']}",
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
                "${ride['brand']} ${ride['model']} ${ride['color']}",
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                "${ride['location']}",
                style: const TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  Text(
                    "${ride['time']}",
                    style: const TextStyle(color: Color(0xFF064789)),
                  ),
                  const Spacer(),
                  const Text(
                    "Unirme al ride",
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
