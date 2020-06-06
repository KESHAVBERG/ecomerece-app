import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status {
  notAuthed,
  unAuthed,
  Authing,
  Authed,
}

class UserProvider extends ChangeNotifier {
  FirebaseUser user;
  FirebaseAuth auth;
  Status status = Status.notAuthed;

  UserProvider.initialize() : auth = FirebaseAuth.instance {
    auth.onAuthStateChanged.listen(onstateSnaged);
  }

  Future<bool> singIn(String email, String password) async {
    try {
      status = Status.Authing;
      notifyListeners();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      status = Status.notAuthed;
      print(e.toString());
      return false;
    }
  }

  Future<bool> singUp(String email, String password,String name) async {
    try {
      status = Status.Authing;
      notifyListeners();
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((user) {
        Firestore.instance.collection("users")
            .document(user.user.uid)
            .setData({
          "name":name,
          "email":email,
          "pic":user.user.photoUrl,
          "id":user.user.uid
        });
      });
      return true;
    } catch (e) {
      status = Status.notAuthed;
      print(e.toString());
      return false;
    }
  }

  signOut()async{
    await auth.signOut();
    status = Status.notAuthed;
    notifyListeners();
  }

  Future <void> onstateSnaged(FirebaseUser event) {
    if(event == null){
      status = Status.notAuthed;
    }else{
      user = event;
      status = Status.Authed;
    }
    notifyListeners();
  }
}
