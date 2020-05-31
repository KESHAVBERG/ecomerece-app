import 'package:ecommerceapp/components/horizontalListView.dart';
import 'package:ecommerceapp/components/recentProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          AssetImage("assests/T2.jpg"),
          AssetImage("assests/T1.jpg"),
          AssetImage("assests/T3.jpg"),
          AssetImage("assests/T4.jpg"),
          AssetImage("assests/T5.jpg"),

        ],
      ),
    );



    return Scaffold(
      appBar: AppBar(
        title: Text("shop"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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
            SizedBox(height: 1,),
            image_car,
            /// ********category Text
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("categories" , style: TextStyle(
                fontSize: 20,
              ),),
            ),
            ///* *********
    ///     horiZontalListvie

            HorizontalList(),
            /// text for recent products
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("recent product" , style: TextStyle(
                fontSize: 20,
              ),),
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
