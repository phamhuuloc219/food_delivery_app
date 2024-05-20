import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

class FirestoreService{
  User user = FirebaseAuth.instance.currentUser!;
  // get collection of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  final rs = RandomString().getRandomString(
    uppersCount: 5,
    lowersCount: 10,
    numbersCount: 8,
  );

  // save order to db
  Future<void> saveOrderToDatabase(String receipt) async{
    await orders.add({
      'id':rs,
      'user':user.displayName?? user.email?? user.phoneNumber,
      'date': DateTime.now(),
      'order' : receipt,
    });
  }
}