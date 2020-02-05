import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
        Category(img_location: 'images/categories/tshirt.png',img_caption: 'T-shirt',),
          Category(img_location: 'images/categories/dress.png',img_caption: 'Dress',),
          Category(img_location: 'images/categories/shoe.png',img_caption: 'Shoe',),
          Category(img_location: 'images/categories/formal.png',img_caption: 'Formal',),
          Category(img_location: 'images/categories/informal.png',img_caption: 'Informal',),
          Category(img_location: 'images/categories/jeans.png',img_caption: 'Jeans',),
          Category(img_location: 'images/categories/accessories.png',img_caption: 'Accessories',)
        ],
      ),
    );
  }
}


class Category extends StatelessWidget {

  final String img_location;

  final String img_caption;

  const Category({Key key, this.img_location, this.img_caption}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Padding(padding: const EdgeInsets.all(2),
      child: ListTile(

          title: Image.asset(img_location,width: 100,height: 80,color: Colors.black,),
        subtitle: Text(
          img_caption,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(fontSize: 12),),
      ),),
    );
  }
}
