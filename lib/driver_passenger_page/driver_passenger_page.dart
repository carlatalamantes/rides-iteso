import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/driver_car_register/car_register_Page.dart';
import 'package:rides_iteso/passenger_home_page/passenger_home_page.dart';
import 'package:rides_iteso/driver_passenger_page/pass_driv_button.dart';

class DriverPassengerPage extends StatelessWidget {
  DriverPassengerPage({super.key});
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is CreateUserRole) {
                  if (state.role == "driver") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const CarRegisterPage()),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const PassengerHomePage()),
                    );
                  }
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Yo soy",
                          style:
                              TextStyle(fontSize: 30, color: Color(0xFF064789)),
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
                                setRole(context, 'passenger');
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
                                setRole(context, 'driver');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ));
    /*
    return 
    */
  }

  void setRole(BuildContext context, String role) {
    BlocProvider.of<UserBloc>(context).add(CreateUserRoleRequested(role));
  }
}
