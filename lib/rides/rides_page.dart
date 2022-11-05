import 'package:flutter/material.dart';
import 'package:rides_iteso/rides/driver/driver_rides_page.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';
import 'package:rides_iteso/rides/passenger/passenger_ride_page.dart';

class RidesPage extends StatefulWidget {
  RidesPage({Key? key}) : super(key: key);

  @override
  _RidesPageState createState() => _RidesPageState();
}

class _RidesPageState extends State<RidesPage> {
  bool isDriver = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
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
                  PassDrivButton(
                    isDriver: isDriver,
                    icon: Icons.car_rental,
                    text: "CONDUCTOR",
                    func: (){handleViewChange(context);}
                  ),
                  PassDrivButton(
                    isDriver: !isDriver,
                    icon: Icons.person,
                    text: "PASAJERO",
                    func: (){handleViewChange(context);}
                  ),
                ],
              ),
              isDriver
                  ? DriverRidePage()
                  : PassengerRidePage(),
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
