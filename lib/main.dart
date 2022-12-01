import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
      ),
      BlocProvider<UserBloc>(create: (context) => UserBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rides ITESO',
        home: const LoginPage(),
        theme: ThemeData(
            primaryColor: Colors.blue.shade900,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
            )));
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
