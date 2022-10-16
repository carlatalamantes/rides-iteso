import 'package:flutter/material.dart';
import 'package:rides_iteso/login/loginPage.dart';
import 'package:rides_iteso/rides/pasajero_Pickup.dart';
import 'package:rides_iteso/signup/signupPage.dart';
import 'package:rides_iteso/test/testPage.dart';

import 'pickupConductor/conductor_Pickup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ConductorPickupPage());
  }
}
