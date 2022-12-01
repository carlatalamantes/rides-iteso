import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoutesC {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> getUser() async {
    await _firestore.collection('users').doc(currentUser!.uid).get();
  }

  Future<void> createRoute({required List<DateTime> dateList}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();

    for (int i = 0; i < dateList.length; i++) {
      //Create a new route
      await _firestore.collection('routes').add({
        'origin': snapshot.data()!['origin'],
        'destination': snapshot.data()!['destination'],
        'driver': currentUser!.uid,
        'dateList': dateList[i],
        'passengers': [],
        'maxPassengers': snapshot.data()!['car']['numPas'],
      });
    }

    //Change the user's firstLogin to false
    await _firestore.collection('users').doc(currentUser!.uid).update({
      'firstLogin': false,
    });
  }

  //Get routes from firestore and return a list of routes
  Future<List> getRoutes() async {
    List routes = [];
    await _firestore.collection('routes').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        routes.add(result.data());
      });
    });
    return routes;
  }
}
