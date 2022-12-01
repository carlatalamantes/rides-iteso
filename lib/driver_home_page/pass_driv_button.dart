
import 'package:flutter/material.dart';

class PassDrivButton extends StatelessWidget {
  const PassDrivButton({
    Key? key,
    required this.isDriver,
    required this.icon,
    required this.text, 
    required this.func,
  }) : super(key: key);

  final bool isDriver;
  final IconData icon;
  final String text;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width:140,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: isDriver ? const Color(0xFF064789) : Colors.grey,
                size: 50,
              ), // <-- Icon
              Text(
                text,
                style: TextStyle(
                  color: isDriver ? const Color(0xFF064789) : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ), // <-- Text
            ],
          ),
        ),
      ),
    );
  }
}
