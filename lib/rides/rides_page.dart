import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:rides_iteso/rides/driver/driver_rides_page.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';
import 'package:rides_iteso/rides/passenger/passenger_ride_page.dart';

import '../bloc/auth/auth.dart';

class RidesPage extends StatefulWidget {
  const RidesPage({Key? key}) : super(key: key);

  @override
  _RidesPageState createState() => _RidesPageState();
}

class _RidesPageState extends State<RidesPage> {
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
        child: Center(
          child: Column(
            children: [
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
                    func: () {
                      handleViewChange(context);
                    },
                  ),
                  PassDrivButton(
                    isDriver: !isDriver,
                    icon: Icons.person,
                    text: "PASAJERO",
                    func: () {
                      handleViewChange(context);
                    },
                  ),
                ],
              ),
              isDriver ? DriverRidePage() : const PassengerRidePage(),
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
