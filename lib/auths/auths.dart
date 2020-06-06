import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<FirebaseUser> googleSigIn();
}

class Auth implements BaseAuth {
  @override
  Future<FirebaseUser> googleSigIn() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount = await googleSignIn
          .signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult result = await firebaseAuth.signInWithCredential(credential);
      FirebaseUser user = result.user;

      Firestore.instance.collection("users")
      .document(user.uid)
      .setData({
        "name":user.displayName,
        "email":user.email,
        "pic":user.photoUrl,
        "userId":user.uid,
      });

      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
