import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/routes/routes_bloc.dart';
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
    BlocProvider.of<RoutesBloc>(context).add(
      GetRoutesRequested(),
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
        listener: (context, state) {
          //Print routes
          if (state is GetRoutes) {
            print(state.routes);
          }
        },
        builder: (context, state) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: BlocProvider.of<RoutesBloc>(context).routes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => {},
                    child: DriverCard(
                      ride: BlocProvider.of<RoutesBloc>(context).routes[index],
                    ));
              });
        },
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
