import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopper_stop/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences ;
  bool loading =false;

  bool isLoggedin =false;


  @override
  void initState() {
    super.initState();
    isSignedin();
  }

  void isSignedin() async {

    setState(() {
      loading = true;
    });
sharedPreferences =await SharedPreferences.getInstance();

isLoggedin = await googleSignIn.isSignedIn();
if(isLoggedin ){

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => HomePage())
  );

  setState(() {
    loading = false ; 
  });
}


  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }


}
