import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerceapp/pages/cart.dart';
import 'package:ecommerceapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/components/horizontalListView.dart';
import 'package:ecommerceapp/components/recentProducts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    /// Image Carousel
    Widget image_car = Container(
      height: 200,
      child: Carousel(
        dotColor: Colors.red,
        dotSize: 5,
        indicatorBgPadding: 7,
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              "https://images.unsplash.com/photo-1514644947855-333735a56a3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          NetworkImage(
              "https://images.unsplash.com/photo-1565548058654-6ba93b5e3135?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          NetworkImage(
              "https://images.unsplash.com/photo-1432712641917-22ce322ab531?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          NetworkImage(
              "https://images.unsplash.com/photo-1586866679244-9efaf05ba3d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
          NetworkImage(
              "https://images.unsplash.com/photo-1587725943749-3d475c15c983?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("shop"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              googleSignIn.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            color: Colors.white,
            icon: Icon(Icons.exit_to_app),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            color: Colors.white,
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.search),
          ),
        ],
      ),

      ///***************Drawer
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              accountName: Text("srk"),
              accountEmail: Text("srk@gmail.com"),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                  label: Text("home")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  label: Text("account")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.business_center),
                  label: Text("my orders")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.category),
                  label: Text("categories")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  label: Text("favorite")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                  label: Text("setting")),
            ),
            Container(
              child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.help),
                  label: Text("about")),
            )
          ],
        ),
      ),

      ///************body
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            image_car,

            /// ********category Text
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "categories",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            ///* *********
            ///     horiZontalListvie

            HorizontalList(),

            /// text for recent products
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "recent product",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              child: Products(),
            )
          ],
        ),
      ),
    );
  }
}
