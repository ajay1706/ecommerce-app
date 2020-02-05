import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shopper_stop/components/horizontal_listview.dart';
import 'package:shopper_stop/components/products.dart';
import 'package:shopper_stop/pages/shopping_cart.dart';
import 'package:shopper_stop/widgets/drawer_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget img_carousel = Container(
    height: 200,
    child: Carousel(
      boxFit: BoxFit.cover,

      images: [
        AssetImage("images/c1.jpg",),
        AssetImage("images/m2.jpg"),
        AssetImage("images/m1.jpeg"),
        AssetImage("images/w1.jpeg"),
        AssetImage("images/w3.jpeg"),
        AssetImage("images/w4.jpeg"),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotColor: Colors.black,
      dotSize: 4.0,
      indicatorBgPadding: 10.0,
dotBgColor: Colors.transparent,
//      overlayShadowColors: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          "Shoppers Stop",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Cart()));
            },
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: ListView(
        children: <Widget>[
          //image carousel
          img_carousel,
          Padding(padding: const EdgeInsets.all(8),
            child: Text("Categories"),),
          HorizontalList(),
          Padding(padding: const EdgeInsets.all(8),
            child: Text("Products"),),

          Container(
            height: 450,
            child: Products(),
          )

          //Horizontal ListView

        ],
      ),
    );
  }
}
