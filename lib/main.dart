import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rides_iteso/ride_register/ride_register_page.dart';
import 'package:rides_iteso/search_rides_page/search_rides_page.dart';
import 'package:rides_iteso/widget_tree.dart';

import 'car_register/car_register_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: CarRegisterPage(),
      ),
    );
  }
}
/*
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: WidgetTree()
        //LoginPage()
        //SignupPage()
        //RidesPage()
        //CarRegisterPage()
        );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body:  RideRegisterPage(),
      ),
    );
  }
*/
