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
        .where('passengers', whereNotIn: [currentUser!.uid])
        .get()
        .then(
          (querySnapshot) {
            //Get car from users collection
            querySnapshot.docs.forEach((doc) async {
              await _firestore
                  .collection('users')
                  .doc(doc['driver'])
                  .get()
                  .then((value) {
                var car = value.data()!['car'];
                var temp = doc.data()['dateList'].toDate();
                var temp2 = DateTime.now();
                if (temp.year == temp2.year &&
                    temp.month == temp2.month &&
                    temp.day == temp2.day) {
                  routes.add({...doc.data(), 'car': car});
                }
              });
            });
          },
        );
    return routes;
  }

  /*
  
    await _firestore
        .collection('routes')
        .where('passengers', whereNotIn: [currentUser!.uid])
        .where('zone', equals: [zone])
        .get()
        .then(
          (querySnapshot) {
            querySnapshot.docs.forEach((result) {
              var quevienedelquery = result.data()['dateList'].toDate();
              var queEvento = //viene del evento
              if (quevienedelquery.year == queEvento.year &&
                  quevienedelquery.month == queEvento.month &&
                  quevienedelquery.day == queEvento.day) {
                routesSearch.add(result.data());
              }
  */

  //Get joined routes from firestore and return a list of routes
  Future<List> getJoinedRoutes() async {
    List routes = [];
    await _firestore
        .collection('routes')
        .where('passengers', arrayContains: currentUser!.uid)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((result) {
                var temp = result.data()['dateList'].toDate();
                var temp2 = DateTime.now();
                if (temp.year == temp2.year &&
                    temp.month == temp2.month &&
                    temp.day == temp2.day) {
                  routes.add(result.data());
                }
              })
            });
    return routes;
  }

  //Join route
  Future<void> joinRoute(String routeId) async {
    //Check if the route is full comparint passengers and maxPassengers
    await _firestore.collection('routes').doc(routeId).get().then((value) {
      if (value.data()!['passengers'].length < value.data()!['maxPassengers']) {
        _firestore.collection('routes').doc(routeId).update({
          'passengers': FieldValue.arrayUnion([currentUser!.uid])
        });
      } else {
        throw ('Route is full');
      }
    }).catchError((e) {
      throw (e);
    });
  }

  //Leave route
  Future<void> leaveRoute(String routeId) async {
    await _firestore.collection('routes').doc(routeId).update({
      'passengers': FieldValue.arrayRemove([currentUser!.uid])
    });
  }
}
