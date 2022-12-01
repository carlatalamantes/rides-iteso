import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/driver_home_page/driver_card.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:rides_iteso/rides/driver/driver_rides_page.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';
import 'package:rides_iteso/rides/passenger/passenger_ride_page.dart';

import '../bloc/auth/auth.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  bool isDriver = true;
  String userUid = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).state;
    print('UserBloc: ${BlocProvider.of<UserBloc>(context).state}');
  }

  Future<void> signOut() async {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }

  var list = [
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "12:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "16:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "23:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "1:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "4:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "23:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "7:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
    {
      "registererd": 1,
      "passengerLimit": 4,
      "time": "9:00",
      "from": "ITESO",
      "to": "Plaza del Sol"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () => signOut(),
                  icon: const Icon(Icons.logout_outlined));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Pickup',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return DriverCard(
                        ride: list[index],
                        index: index
                      );
                    },
                  ),
                  base_ElevatedButton(
                    text: "Añadir dias",
                    backgroundColor: const Color(0xFF064789),
                    onPressed: () {
                      addDates();
                    },
                  ),
                  base_ElevatedButton(
                    text: "Future Days",
                    backgroundColor: const Color(0xFF064789),
                    onPressed: () {
                      addDates();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  addDates() {
    print("add dates");
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
