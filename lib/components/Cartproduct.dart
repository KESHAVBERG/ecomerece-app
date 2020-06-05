import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products = [
    {
      "name": "shoes5",
      "picture": "hori/H1.jpg",
      "old_price": 34,
      "new_price": 0,
      "size": "10",
      "color": "black",
      "qunatity": 10
    },
    {
      "name": "shoes4",
      "picture": "hori/H2.jpg",
      "old_price": 34,
      "new_price": 0,
      "size": "10",
      "color": "black",
      "qunatity": 10
    },
//    {
//      "name": "shoes3",
//      "picture": "hori/H3.jpg",
//      "old_price": 34,
//      "new_price": 0,
//    },
//    {
//      "name": "shoes2",
//      "picture": "hori/H4.jpg",
//      "old_price": 34,
//      "new_price": 0,
//    },
////    {
//      "name": "shoes1",
//      "picture": "hori/H5.jpg",
//      "old_price": 34,
//      "new_price": 0,
//    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleCartProducts(
            prod_name: products[index]["name"],
            prod_pic: products[index]["picture"],
            prod_newPrice: products[index]["new_price"],
            color: products[index]["color"],
            size: products[index]["size"],
            qunatity: products[index]["qunatity"],
          );
        });
  }
}

class SingleCartProducts extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_newPrice;

  final color;
  final size;
  final qunatity;

  const SingleCartProducts(
      {Key key,
      this.prod_name,
      this.prod_pic,
      this.prod_newPrice,
      this.color,
      this.size,
      this.qunatity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        /// leading
        leading: Image.asset(
          prod_pic,
          width: 100,
        ),

        /// title
        title: Text("${prod_name}"),

        /// sub title
        subtitle: Column(
          children: <Widget>[
            ///colors and size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("color:"),
                Text("$color"),
                Divider(
                  thickness: 20,
                ),
                Text("size:"),
                Text("$size"),
              ],
            ),

            ///total
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("total"),
                SizedBox(
                  width: 10,
                ),
                Text("${prod_newPrice}"),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                  },
                  icon: Icon(Icons.add),
                ),

                Text("${qunatity}"),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.minimize),
                )
              ],
            )
          ],
        ),

        ///traling
//        trailing: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            IconButton(
//              onPressed: (){},
//              icon: Icon(Icons.arrow_drop_up),
//            ),
//            Text("${qunatity}"),
//            IconButton(
//              onPressed: (){},
//              icon: Icon(Icons.arrow_drop_down),
//            )
//          ],
//        ),
      ),
    );
  }
}
