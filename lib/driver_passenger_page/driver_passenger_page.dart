
import 'package:flutter/material.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';

class DriverPassengerPage extends StatelessWidget {
  const DriverPassengerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            PassDrivButton(
              isDriver: true,
              icon: Icons.person,
              text: "PASAJERO",
              func: () {
                imDriver(context);
              },
            ),
            SizedBox(
              height: 70,
            ),
            PassDrivButton(
              isDriver: true,
              icon: Icons.car_rental,
              text: "CONDUCTOR",
              func: () {
                (context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void imDriver(BuildContext context) {
    print("driver");
  }

  void imPassenger(BuildContext context) {
    print("driver");
    }
}
