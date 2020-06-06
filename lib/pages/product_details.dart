import 'package:ecommerceapp/components/recentProducts.dart';
import 'package:ecommerceapp/pages/cart.dart';
import 'package:ecommerceapp/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// product details with only front end
//
//class ProductDetails extends StatefulWidget {
//  final product_detail_name;
//  final product_detail_new_price;
//  final product_detail_old_price;
//  final product_detail_picture;
//
//  const ProductDetails(
//      {Key key,
//      this.product_detail_name,
//      this.product_detail_new_price,
//      this.product_detail_old_price,
//      this.product_detail_picture})
//      : super(key: key);
//
//  @override
//  _ProductDetailsState createState() => _ProductDetailsState();
//}
//
//class _ProductDetailsState extends State<ProductDetails> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: GestureDetector(
//            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => MyHomePage()));
//            },
//            child: Text("FlashApp")),
//      ),
//      body: Container(
//        alignment: Alignment.centerLeft,
//        child: ListView(
//          children: <Widget>[
//            Container(
//              height: 300.0,
//              child: GridTile(
//                footer: Container(
//                  color: Colors.white,
//                  child: ListTile(
//                    leading: Text(widget.product_detail_name),
//                    title: Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        Expanded(
//                            child: Text(
//                          "${widget.product_detail_old_price}",
//                          style:
//                              TextStyle(decoration: TextDecoration.lineThrough),
//                        )),
//                        Expanded(
//                            child: Text("${widget.product_detail_new_price}")),
//                      ],
//                    ),
//                  ),
//                ),
//                child: Container(
//                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                  child: Image.asset(
//                    widget.product_detail_picture,
//                    fit: BoxFit.cover,
//                  ),
//                ),
//              ),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                ///**************button for size
//                GestureDetector(
//                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text("size"),
//                            content: Text("choose your size"),
//                            actions: <Widget>[
//                              MaterialButton(
//                                child: Text("close"),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                },
//                              )
//                            ],
//                          );
//                        });
//                  },
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text("size"),
//                      Icon(Icons.arrow_drop_down)
//                    ],
//                  ),
//                ),
//
//                ///**************button for color
//                GestureDetector(
//                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text("color"),
//                            content: Text("choose your color"),
//                            actions: <Widget>[
//                              MaterialButton(
//                                child: Text("close"),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                },
//                              )
//                            ],
//                          );
//                        });
//                  },
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text("color"),
//                      Icon(Icons.arrow_drop_down)
//                    ],
//                  ),
//                ),
//
//                ///**************button for quntatiy
//                GestureDetector(
//                  onTap: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                            title: Text("quantity"),
//                            content: Text("choose your quantiy"),
//                            actions: <Widget>[
//                              MaterialButton(
//                                child: Text("close"),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                },
//                              )
//                            ],
//                          );
//                        });
//                  },
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text("quntaty"),
//                      Icon(Icons.arrow_drop_down)
//                    ],
//                  ),
//                )
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                FlatButton(
//                  onPressed: () {},
//                  color: Colors.red,
//                  child: Text("buy now"),
//                ),
//                IconButton(
//                  onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => Cart()));
//                  },
//                  icon: Icon(Icons.shopping_cart),
//                ),
//                IconButton(
//                  onPressed: () {},
//                  icon: Icon(Icons.favorite),
//                ),
//              ],
//            ),
//            ListTile(
//              title: Text("product details"),
//              subtitle: Text(
//                  "It was so great to hear from you today and it was such weird timing,"
//                  "This is going to sound funny and a little strange, but you were in a dream I had just a couple of days ago. I'd love to get together and tell you about it if you're up for a cup of coffee,"),
//            ),
//            Divider(),
//            Row(
//              children: <Widget>[
//                Padding(
//                    padding: EdgeInsets.all(10), child: Text("product name ")),
//                Padding(
//                    padding: EdgeInsets.all(10),
//                    child: Text(widget.product_detail_name)),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Padding(
//                    padding: EdgeInsets.all(10), child: Text("product brand ")),
//                Padding(padding: EdgeInsets.all(10), child: Text("X brand ")),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Padding(
//                    padding: EdgeInsets.all(10),
//                    child: Text("product condition ")),
//                Padding(
//                    padding: EdgeInsets.all(10), child: Text(" new product  ")),
//              ],
//            ),
//            Divider(
//              height: 2,
//            ),
//            Padding(
//              padding: EdgeInsets.all(10),
//              child: Text("Similar Product"),
//            ),
//            SimilarProduct()
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class SimilarProduct extends StatefulWidget {
//  @override
//  _SimilarProductState createState() => _SimilarProductState();
//}
//
//class _SimilarProductState extends State<SimilarProduct> {
//  var products = [
//    {
//      "name": "shoes5",
//      "picture": "hori/H1.jpg",
//      "old_price": 34,
//      "new_price": 0,
//    },
//    {
//      "name": "shoes4",
//      "picture": "hori/H2.jpg",
//      "old_price": 34,
//      "new_price": 0,
//    },
////    {
////      "name": "shoes3",
////      "picture": "hori/H3.jpg",
////      "old_price": 34,
////      "new_price": 0,
////    },
////    {
////      "name": "shoes2",
////      "picture": "hori/H4.jpg",
////      "old_price": 34,
////      "new_price": 0,
////    },
//////    {
////      "name": "shoes1",
////      "picture": "hori/H5.jpg",
////      "old_price": 34,
////      "new_price": 0,
////    },
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//        shrinkWrap: true,
//        itemCount: products.length,
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2,
//        ),
//        itemBuilder: (context, index) {
//          /// SingleGridView is a imported class from recentProducts
//          return SingleGridView(
//            prod_name: products[index]["name"],
//            prod_newPrice: products[index]["new_price"],
//            prod_pic: products[index]["picture"],
//            prod_oldPrice: products[index]["old_price"],
//          );
//        });
//  }
//}
/// product details with only front end

/// product details with back end starts


