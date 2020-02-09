import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  SharedPreferences sharedPreferences;

  bool loading = false;

  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    isSignedin();
  }

  void isSignedin() async {
    setState(() {
      loading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();

    isLoggedin = await googleSignIn.isSignedIn();
    if (isLoggedin) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));

      setState(() {
        loading = false;
      });
    }
  }

  Future<FirebaseUser> signIn() async {

    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gsa.accessToken,
      idToken: gsa.idToken,
    );
    final FirebaseUser firebaseUser =
        (await _firebaseAuth.signInWithCredential(credential)).user;
//    final FirebaseUser firebaseUser = authResult.user;
//
//    final FirebaseUser user = authResult.user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents == 0) {
        //Insert user to collection

        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "photoUrl": firebaseUser.photoUrl
        });

        await sharedPreferences.setString("id", firebaseUser.uid);
        await sharedPreferences.setString("username", firebaseUser.displayName);
        await sharedPreferences.setString("photoUrl", firebaseUser.photoUrl);
      } else {
        await sharedPreferences.setString("id", documents[0]['id']);
        await sharedPreferences.setString("username", documents[0]['username']);
        await sharedPreferences.setString("photoUrl", documents[0]['photoUrl']);
      }

      Fluttertoast.showToast(msg: "Login was Successful!");

      setState(() {
        loading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: FlatButton(onPressed: signIn, child: Text('Login',
            style: TextStyle(color: Colors.white),),color: Colors.black,),
          ),
          Visibility(
            visible: loading??true,

              child: Center(
                child: Container(
                  color: Colors.white.withOpacity(0.7),
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
              ))
        ],
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: Colors.black
    ),
          child: FlatButton(onPressed: signIn, child: Text("Google",
    style: TextStyle(
    fontSize: 18,
    color: Colors.white
    ),),
          )
    ),
      ));
  }
}
