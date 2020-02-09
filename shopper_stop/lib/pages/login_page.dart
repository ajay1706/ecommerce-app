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
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

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
            Image.asset(
              "images/back.jpg",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top:300.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(

                              decoration: InputDecoration(
                                isDense: true,
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintText: "Email",
                                icon: Icon(Icons.mail),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 0,
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    validator: (val){
                                      if(val.isEmpty){
                                        return "The password field cannot be empty";
                                      }
                                      else if(val.length < 6){
                                        return "password is too weak";

                                      }
                                      return null;
                                    },
                                  )))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 0,
                          color: Colors.black,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                           child: MaterialButton(

                             onPressed: (){},
                             minWidth: MediaQuery.of(context).size.width,
                             child: Text('Login ',
                               textAlign: TextAlign.center,
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 18,
                               fontWeight: FontWeight.w600
                             ),),
                           ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()), 
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(

                          color: Colors.white,thickness: 1,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 0,
                          color: Colors.red,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: MaterialButton(

                              onPressed:(){
                                signIn();}
                              ,
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text('Google ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
//            Visibility(
//                visible: loading ?? false,
//                child: Center(
//                  child: Container(
//                    alignment: Alignment.center,
//                    color: Colors.white.withOpacity(0.2),
//                    child: CircularProgressIndicator(
//                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                    ),
//                  ),
//                ))
          ],
        ),
      );
  }
}
