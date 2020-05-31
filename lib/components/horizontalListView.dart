import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: "hori/H1.jpg",
            caption: "skrit",
          ),
          Category(
            imageLocation: "hori/H2.jpg",
            caption: "T-shirt",
          ),
          Category(
            imageLocation: "hori/H3.jpg",
            caption: "blazer",
          ),
          Category(
            imageLocation: "hori/H4.jpg",
            caption: "shirt",
          ),
          Category(
            imageLocation: "hori/H5.jpg",
            caption: "glasses",
          ),
//          Category(
//            imageLocation: "assests/H6.jpg",
//            caption: "caption",
//          ),
//          Category(
//            imageLocation: "assests/H7.jpg",
//            caption: "caption",
//          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation, caption;

  const Category({Key key, this.imageLocation, this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            subtitle: Text(caption),
          ),
        ),
      ),
    );
  }
}
