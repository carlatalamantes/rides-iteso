import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PassengerC {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> getUser() async {
    await _firestore.collection('users').doc(currentUser!.uid).get();
  }

  //Get routes from firestore and return a list of routes
  Future<List> getRoutes() async {
    List routes = [];
    await _firestore
        .collection('routes')
        .where('passengers', arrayContains: currentUser!.uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result.data()['dateList'].toDate().isAfter(DateTime.now())) {
          routes.add(result.data());
        }
      });
    });
    return routes;
  }

  //Join route
  Future<void> joinRoute(String routeId) async {
    await _firestore.collection('routes').doc(routeId).update({
      'passengers': FieldValue.arrayUnion([currentUser!.uid])
    });
  }

  //Leave route
  Future<void> leaveRoute(String routeId) async {
    await _firestore.collection('routes').doc(routeId).update({
      'passengers': FieldValue.arrayRemove([currentUser!.uid])
    });
  }
}
