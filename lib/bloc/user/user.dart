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
  }) async {
    final data = {
      'car': {
        'model': carModel,
        'year': carYear,
        'color': carColor,
        'plate': carPlate,
        'brand': carBrand,
      }
    };
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .set(data, SetOptions(merge: true));
  }
}
