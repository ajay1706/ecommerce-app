import 'package:flutter/material.dart';
import 'package:shopper_stop/pages/homepage.dart';
import 'package:shopper_stop/pages/login_page.dart';
import 'package:shopper_stop/pages/register_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}

