import 'package:flutter/material.dart';
import 'package:rides_iteso/car_register/car_register_Page.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';

class DriverPassengerPage extends StatelessWidget {
  const DriverPassengerPage({super.key});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Yo soy",
                  style: TextStyle(fontSize: 30, color: Color(0xFF064789)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    PassDrivButton(
                      isDriver: true,
                      icon: Icons.person,
                      text: "PASAJERO",
                      func: () {
                        imPassenger(context);
                      },
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    PassDrivButton(
                      isDriver: true,
                      icon: Icons.car_rental,
                      text: "CONDUCTOR",
                      func: () {
                        imDriver(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    /*
    return 
    */
  }

  void imDriver(BuildContext context) {
    print("driver");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CarRegisterPage()),
    );
  }

  void imPassenger(BuildContext context) {
    print("driver");
    //TODO: implementar
  }
}
