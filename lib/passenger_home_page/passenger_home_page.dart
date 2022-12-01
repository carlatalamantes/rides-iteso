import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/routes/routes_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/driver_home_page/driver_card.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:rides_iteso/passenger_home_page/passenger_card.dart';
import 'package:rides_iteso/ride_calendar/ride_calendar.dart';
import 'package:rides_iteso/rides/driver/driver_rides_page.dart';
import 'package:rides_iteso/rides/pass_driv_button.dart';
import 'package:rides_iteso/rides/passenger/passenger_ride_page.dart';

import '../bloc/auth/auth.dart';

class PassengerHomePage extends StatefulWidget {
  const PassengerHomePage({super.key});

  @override
  State<PassengerHomePage> createState() => _PassengerHomePage();
}

class _PassengerHomePage extends State<PassengerHomePage> {
  bool isDriver = true;
  String userUid = '';
  bool getFutureRoutes = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RoutesBloc>(context).add(
      GetRoutesRequested(getFutureRoutes),
    );
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
      body: BlocConsumer<RoutesBloc, RoutesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
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
                        itemCount: state.routes.length,
                        itemBuilder: (context, index) {
                          return PassengerCard(
                              ride: state.routes[index], imParticipant: false);
                        },
                      ),
                      /*
                      base_ElevatedButton(
                        text: "AÑADIR HORARIOS",
                        backgroundColor: const Color(0xFF064789),
                        onPressed: () {
                          addDates();
                        },
                      ),
                      base_ElevatedButton(
                        text: getFutureRoutes ? "VER PASADOS" : "VER FUTUROS",
                        backgroundColor: const Color(0xFF064789),
                        onPressed: () {
                          futuros();
                        },
                      )
                      */
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  addDates() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RideCalendar(),
      ),
    );
  }

  futuros() {
    setState(() {
      getFutureRoutes = !getFutureRoutes;
    });
    BlocProvider.of<RoutesBloc>(context).add(
      GetRoutesRequested(getFutureRoutes),
    );
  }

  handleViewChange(context) {
    setState(() {
      isDriver = !isDriver;
    });
  }
}