import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Stream get authStateChangesFire => _firestore.collection('users').snapshots();

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String secondLastName,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((registeredUser) async {
      //Create user in firestore
      await _firestore.collection('users').doc(registeredUser.user?.uid).set({
        'uid': registeredUser.user!.uid,
        'name': name,
        'lastName': lastName,
        'secondLastName': secondLastName,
        'firstLogin': true,
      });
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<DocumentSnapshot> getUserData() async {
    return _firestore.collection('users').doc(currentUser!.uid).get();
  }

  Future<String> getUserId() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return snapshot.data()!['uuid'];
  }

  Future<bool> isUserFirstLogin() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return snapshot.data()!['firstLogin'];
  }

  Future<String> getUserRole() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return snapshot.data()!['role'];
  }
}
