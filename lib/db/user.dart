import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  createUser(Map userData, String uid) async {
    Firestore.instance
        .collection("users")
        .document(uid)
        .setData(userData)
        .catchError((e) => print(e.toString()));
  }
}
