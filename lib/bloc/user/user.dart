import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserC {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> getUserCar() async {
    await _firestore.collection('users').doc(currentUser!.uid).get();
  }

  Future<void> createUserCar({
    required String carModel,
    required String carYear,
    required String carColor,
    required String carPlate,
    required String carBrand,
    required String numPas,
  }) async {
    final data = {
      'car': {
        'model': carModel,
        'year': carYear,
        'color': carColor,
        'plate': carPlate,
        'brand': carBrand,
        'numPas': int.parse(numPas),
      }
    };
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .set(data, SetOptions(merge: true));
  }

  Future<void> createUserRole({
    required String role,
  }) async {
    final data = {
      'role': role,
    };
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .set(data, SetOptions(merge: true));

    if (role == 'passenger') {
      //Change the user's firstLogin to false
      await _firestore.collection('users').doc(currentUser!.uid).update({
        'firstLogin': false,
      });
    }
  }

  Future<void> createOriginDestination({
    required String origin,
    required String destination,
  }) async {
    final data = {
      'origin': origin,
      'destination': destination,
    };
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .set(data, SetOptions(merge: true));
  }
}
