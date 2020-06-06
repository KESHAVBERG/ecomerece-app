import 'package:ecommerceapp/db/user.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:ecommerceapp/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  /// Form key
  final _formKey = GlobalKey<FormState>();

  /// Text controllers
  TextEditingController emailEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();
  TextEditingController confirmPasswordEditController = TextEditingController();
  TextEditingController nameEditController = TextEditingController();

  UserService userService = UserService();

  /// String
  String groupVale = "male";
  String gender;

  /// _auth

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// ***methods
  valueChanged(val) {
    setState(() {
      if (val == "male") {
        groupVale = val;
        gender = val;
      } else if (val == "female") {
        groupVale = val;
        gender = val;
      }
    });
  }

//  Future registerUser() async {
//    AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
//        email: emailEditController.text, password: passwordEditController.text);
//
//    FirebaseUser user = result.user;
//    Map <String , dynamic>userMap = {
//    "name":nameEditController.text,
//      "email":emailEditController.text,
////      "profilePic":user.photoUrl,
//      "id":user.uid,
//      "gender":gender
//    };
//    userService.createUser(userMap, user.uid);
//
//    Navigator.pushReplacement(
//        context, MaterialPageRoute(builder: (context) => MyHomePage()));
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("login"),
        ),

        ///*****************body
        body: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Text("Register"),
                      Spacer(),

                      ///name
                      TextFormField(
                        controller: nameEditController,
                        validator: (val) => val.isEmpty ? "enter a name" : null,
                        decoration: InputDecoration(hintText: "name"),
                      ),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("male"),
                            trailing: Radio(
                              value: "male",
                              groupValue: groupVale,
                              onChanged: (val) => valueChanged(val),
                            ),
                          ),
                          ListTile(
                            title: Text("female"),
                            trailing: Radio(
                              value: "female",
                              groupValue: groupVale,
                              onChanged: (val) => valueChanged(val),
                            ),
                          )
                        ],
                      ),

                      /// email
                      TextFormField(
                        controller: emailEditController,
                        validator: (val) =>
                            val.isEmpty ? "enter a email" : null,
                        decoration: InputDecoration(hintText: "email"),
                      ),

                      ///password
                      TextFormField(
                        controller: passwordEditController,
                        validator: (val) => val.isEmpty || val.length < 3
                            ? "enter a password"
                            : null,
                        decoration: InputDecoration(hintText: "password"),
                      ),

                      /// confirm password
                      TextFormField(
                        controller: confirmPasswordEditController,
                        validator: (val) =>
                            val.isEmpty || passwordEditController.text != val
                                ? "enter a valid password"
                                : null,
                        decoration:
                            InputDecoration(hintText: "confirm password"),
                      ),

                      FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
//                            registerUser();
                          }
                        },
                        child: Text("register"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("login"),
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
