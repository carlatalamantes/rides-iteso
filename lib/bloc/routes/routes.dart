import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoutesC {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> getUser() async {
    await _firestore.collection('users').doc(currentUser!.uid).get();
  }

  Future<void> createRoute({required DateTime datetime}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(currentUser!.uid).get();

    final data = {
      'origin': snapshot.data()!['origin'],
      'destination': snapshot.data()!['destination'],
      'idDriver': currentUser!.uid,
      'passengers': [],
      'datetime': datetime,
    };
    await _firestore.collection('routes').doc().set(data);
  }

  //Get routes from firestore and return a list of routes
  Future<List> getRoutes() async {
    List routes = [];
    await _firestore.collection('routes').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        routes.add(result.data());
      });
    });
    return routes;
  }
}
