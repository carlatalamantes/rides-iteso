import 'package:flutter/material.dart';
import 'package:rides_iteso/signup/driver/conductor_Car.dart';
import 'package:rides_iteso/signup/passenger/pasajero_Pickup.dart';

class CompleteProfilePage extends StatefulWidget {
  CompleteProfilePage({Key? key}) : super(key: key);

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  bool isDriver = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Yo soy',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        handleViewChange(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.car_rental,
                            color: isDriver
                                ? const Color(0xFF064789)
                                : Colors.grey,
                            size: 50,
                          ), // <-- Icon
                          Text("CONDUCTOR",
                              style: TextStyle(
                                  color: isDriver
                                      ? const Color(0xFF064789)
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        handleViewChange(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: isDriver
                                ? Colors.grey
                                : const Color(0xFF064789),
                            size: 50,
                          ), // <-- Icon
                          Text("PASAJERO",
                              style: TextStyle(
                                  color: isDriver
                                      ? Colors.grey
                                      : const Color(0xFF064789),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)), // <-- Text
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isDriver
                  ? ConductorCarPage(context)
                  : PasajeroPickupPage(context),
            ],
          ),
        ),
      ),
    );
  }

  guardarButton(BuildContext context) {
    /*   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    ); */
  }

  handleViewChange(context) {
    setState(() {
      isDriver = !isDriver;
    });
  }
}
