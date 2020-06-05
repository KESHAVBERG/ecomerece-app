import 'package:ecommerceapp/components/Cartproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          )
        ],
      ),
      /// bottom navigation bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("total"),
                subtitle: Text(""),
              ),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: (){},
              child: Text("check out"),
            )
          ],
        ),
      ),
      ///body

   body: CartProducts(),
    );
  }
}
