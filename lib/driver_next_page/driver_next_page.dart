import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/driver_next_page/driver_next_card.dart';
import 'package:rides_iteso/login/login_page.dart';


class DriverNextPage extends StatefulWidget {
  const DriverNextPage({super.key});

  @override
  State<DriverNextPage> createState() => _DriverNextPageState();
}

class _DriverNextPageState extends State<DriverNextPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
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
                const DriverNextCard(
                  ride: {
                    "registererd": 1,
                    "passengerLimit": 4,
                    "time": "16:00",
                    "from": "ITESO",
                    "to": "Plaza del Sol",
                    "day": "13/11/2222"
                  },
                  index: 1,
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
