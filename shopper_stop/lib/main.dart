import 'package:flutter/material.dart';
import 'package:shopper_stop/widgets/drawer_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text("Shoppers Stop",
          style: TextStyle(
              color: Colors.black
          ),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){},


          ),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,), onPressed: (){},)
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}
