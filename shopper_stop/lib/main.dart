import 'package:flutter/material.dart';
import 'package:shopper_stop/pages/homepage.dart';
import 'package:shopper_stop/pages/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

