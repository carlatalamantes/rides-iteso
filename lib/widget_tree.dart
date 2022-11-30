import 'package:flutter/material.dart';
import 'package:rides_iteso/bloc/auth/auth.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:rides_iteso/rides/rides_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RidesPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
