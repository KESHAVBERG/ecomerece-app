import 'package:ecommerceapp/auths/auths.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:ecommerceapp/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool isLoading = false;
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();

  handleSign(GoogleSignInAccount account){
    if(account != null){
      setState(() {
        isLoggedIn  = true;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>MyHomePage()
      ));
    }else{
      isLoggedIn = false;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    isSignedIn();
  googleSignIn.signInSilently(suppressErrors: false).then((value) => handleSign(value));

  }

//  isSignedIn() async {
//    setState(() {
//      isLoading = true;
//    });
//    preferences = await SharedPreferences.getInstance();
//    isLoggedIn = await googleSignIn.isSignedIn();
//    ///
//   await firebaseAuth.currentUser().then((user){
//      if(user != null){
//        isLoggedIn = true;
//      }
//    } );
//   ///
//    if (isLoggedIn) {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => MyHomePage()));
//    }
//
//    setState(() {
//      isLoading = false;
//    });
//  }
//
//  Future handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//    setState(() {
//      isLoading = true;
//    });
//
//    GoogleSignInAccount googleUser = await googleSignIn.signIn();
//
//    GoogleSignInAuthentication googleSignInAuthentication =
//        await googleUser.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: googleSignInAuthentication.idToken,
//        accessToken: googleSignInAuthentication.accessToken);
//
//    AuthResult result = await firebaseAuth.signInWithCredential(credential);
//    FirebaseUser user = result.user;
//    if (user != null) {
//      final QuerySnapshot snapshot = await Firestore.instance
//          .collection("users")
//          .where("id", isGreaterThanOrEqualTo: user.uid)
//          .getDocuments();
//
//      final List<DocumentSnapshot> doc = snapshot.documents;
//
//      if (doc.length == 0) {
//        Firestore.instance.collection("users").document(user.uid).setData({
//          "id": user.uid,
//          "name": user.displayName,
//          "email": user.email,
//          "profilePic": user.photoUrl
//        });
//        await preferences.setString("id", user.uid);
//        await preferences.setString("name", user.displayName);
//        await preferences.setString("profilePic", user.photoUrl);
//      } else {
//        await preferences.setString("id", doc[0]["id"]);
//        await preferences.setString("name", doc[0]["name"]);
//        await preferences.setString("profilePic", doc[0]["profilePic"]);
//      }
//      setState(() {
//        isLoading = false;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("login"),
        ),

        ///*************************bottomnavigationabr
        bottomNavigationBar: Container(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(100)),
            height: 70,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: FlatButton(
//              onPressed: () => handleSignIn(),
            onPressed: (){
              Auth().googleSigIn();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>MyHomePage()
              ));
            },
              child: Text("login in with google"),
            ),
          ),
        ),

        ///*****************body
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text("welcome back!"),
                      Spacer(),
                      TextFormField(
                        controller: emailEditController,
                        validator: (val) =>
                            val.isEmpty ? "enter a email" : null,
                        decoration: InputDecoration(hintText: "email"),
                      ),
                      TextFormField(
                        controller: passwordEditController,
                        validator: (val) => val.isEmpty || val.length < 3
                            ? "enter a password"
                            : null,
                        decoration: InputDecoration(hintText: "password"),
                      ),
                      FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {


                          }
                        },
                        child: Text("login"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text("register"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
