import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController {
  var currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }

  Future<void> incrementValue() async {
    final String auth = FirebaseAuth.instance.currentUser!.uid;
    final document =
        FirebaseFirestore.instance.collection('users').doc('$auth');
    document.update({"balance": FieldValue.increment(100)});
  }
}
