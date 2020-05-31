import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  const ProductDetails(
      {Key key,
      this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.asset(
                    widget.product_detail_picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
