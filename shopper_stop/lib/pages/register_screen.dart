import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopper_stop/pages/login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  bool loading = false ;
  String gender ;

  String groupValue = "male";

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
            padding: const EdgeInsets.only(top: 300.0),
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 0,
                            color: Colors.white.withOpacity(0.5),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Name",
                                    icon: Icon(Icons.person_outline),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _nameController,

                                )))),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(9),
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),

                      child: Row(
                        children: <Widget>[
                          Expanded(child: ListTile(
                            title: Text("Male",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 18,color: Colors.black),),
                            leading: Radio(
                                activeColor: Colors.black,
                                value: "male", groupValue: groupValue, onChanged: (e) => valueChanged(e) ),
                          )),
                          Expanded(child: ListTile(
                            title: Text("Female",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 18,color: Colors.black),),
                            leading: Radio(
activeColor: Colors.black,                                value: "female", groupValue: groupValue, onChanged: (e) => valueChanged(e) ),
                          )),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0,
                        color: Colors.white.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            cursorColor: Colors.black,

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
                            color: Colors.white.withOpacity(0.5),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  leading: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _passwordController,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "The password field cannot be empty";
                                      }
                                      else if (val.length < 6) {
                                        return "password is too weak";
                                      }
                                      return null;
                                    },
                                  ),
                                  trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: null),
                                )))),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 0,
                            color: Colors.white.withOpacity(0.5),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Confirm Password",
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _confirmPassController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "The password field cannot be empty";
                                    }
                                    else if (val.length < 6) {
                                      return "password is too weak";
                                    }
                                    else if(_passwordController.value!= val){
                                      return "Password didn't match";

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

                            onPressed: () {},
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text('Register ',
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

                    InkWell(

                      child: Text("Login",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          fontWeight: FontWeight.w600,
                          backgroundColor: Colors.black54,

                        ),),
                      onTap: (){

                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                      },

                    )
//                      RichText(text: TextSpan(
//                        children: [
//                          TextSpan(
//                            text: "Did'nt have an account? ",
//                            style: TextStyle(color: Colors.black,)
//                          ),
//                          TextSpan(
//                              text: "sign up",
//                              style: TextStyle(color: Colors.red,
//                              fontWeight: FontWeight.w900)
//                          )
//                        ]
//                      )),
                    ,
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(

                        color: Colors.white, thickness: 1,),
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

                            onPressed: () {
//                              signIn();
                            }
                            ,
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width,
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

  valueChanged(e) {

    setState(() {
      if(e == "male"){
groupValue = e ;
gender = e ;
      }
      else if(e == "female"){
        groupValue =e ;
        gender = e;

      }
    });
  }
}
