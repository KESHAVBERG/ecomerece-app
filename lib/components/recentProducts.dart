import 'package:ecommerceapp/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products = [
    {
      "name": "shoes5",
      "picture": "hori/H1.jpg",
      "old_price": 34,
      "new_price": 0,
    },
    {
      "name": "shoes4",
      "picture": "hori/H2.jpg",
      "old_price": 34,
      "new_price": 0,
    },
    {
      "name": "shoes3",
      "picture": "hori/H3.jpg",
      "old_price": 34,
      "new_price": 0,
    },
    {
      "name": "shoes2",
      "picture": "hori/H4.jpg",
      "old_price": 34,
      "new_price": 0,
    },
    {
      "name": "shoes1",
      "picture": "hori/H5.jpg",
      "old_price": 34,
      "new_price": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return SingleGridView(
            prod_name: products[index]["name"],
            prod_newPrice: products[index]["new_price"],
            prod_pic: products[index]["picture"],
            prod_oldPrice: products[index]["old_price"],
          );
        });
  }
}

class SingleGridView extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_oldPrice;
  final prod_newPrice;

  const SingleGridView(
      {Key key,
      this.prod_name,
      this.prod_pic,
      this.prod_oldPrice,
      this.prod_newPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              product_detail_name: prod_name,
                              product_detail_new_price: prod_newPrice,
                              product_detail_old_price: prod_oldPrice,
                              product_detail_picture: prod_pic,
                            )));
              },
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text("$prod_name"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "\$$prod_oldPrice",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                        Text("\$$prod_newPrice")
                      ],
                    ),
                  ),
                ),
                child: Image.asset(
                  prod_pic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
