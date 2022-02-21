import 'dart:io';

import 'package:appointz_client/Services/toast.dart';
import 'package:appointz_client/Views/Helpers/progress_hud.dart';
import 'package:appointz_client/Views/Home/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:appointz_client/Views/SignUp/SignUp.dart';
import 'package:flutter/material.dart';

import 'Login_Button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool loader = false;
  final _auth = FirebaseAuth.instance;
  final ToastMsg _toast = ToastMsg();

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: loader,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.navigate_before_rounded,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Image.asset(
            'assests/logo.png',
            color: const Color.fromRGBO(231, 232, 225, 1),
            scale: 4.3,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(7, 78, 99, 0.8),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                const Align(
                  child: Text("Log In",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(7, 78, 99, 0.8),
                        letterSpacing: 0.7,
                      )),
                ),

                const SizedBox(
                  height: 40.00,
                ),

                // --- Text Field( Email ) --- //
                Theme(
                  data: ThemeData(primaryColor: Colors.transparent),
                  child: SizedBox(
                    height: 55,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.mail,
                                color: Color.fromRGBO(7, 78, 99, 0.7),
                              ),
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextField(
                                maxLines: 1,
                                selectionWidthStyle: BoxWidthStyle.tight,
                                controller: emailController,
                                cursorColor:
                                    const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                Container(height: 25),

                // --- Text Field( Password ) --- //
                Theme(
                  data: ThemeData(primaryColor: Colors.transparent),
                  child: SizedBox(
                    height: 55,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(7, 78, 99, 0.7),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                maxLines: 1,
                                selectionWidthStyle: BoxWidthStyle.tight,
                                controller: passController,
                                cursorColor:
                                    const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'Password',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                Container(height: 25),

                LoginButton(
                  onTapAction: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                          builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),

                Container(height: 20),

                Column(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15
                          // color: Color.fromRGBO(7, 78, 99, 0.8),
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "\nSign up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(7, 78, 99, 0.8),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _signIn() async {
    // setState(() {
    //   loader = true;
    // });
    //
    // debugPrint(emailController.text.toString());
    // debugPrint(passController.text.toString());
    try {
      // final newUser = await _auth.signInWithEmailAndPassword(
      //   email: emailController.text,
      //   password: passController.text,
      // );
      //
      // if (newUser != null) {
      //   _toast.showToast('Sign In Successful');
      //   debugPrint('Sign In Successful');
      //   Navigator.push(context,
      //       CupertinoPageRoute(builder: (context) => const HomePage()));
      // } else {
      //   debugPrint('Sign In Failed');
      //   _toast.showToast('Sign In Failed');
      // }
      // setState(() {
      //   loader = false;
      // });

    } on SocketException {
      _toast.showToast('Sign Failed Sockets Suspension');
      debugPrint('Sign In Failed Sockets Suspension');
      setState(() {
        loader = false;
      });
    } on HttpException {
      _toast.showToast('Http request failed');
      debugPrint('Sign In Failed Http request failed');
      setState(() {
        loader = false;
      });
    } on FirebaseAuthException catch (firebaseError) {
      debugPrint(firebaseError.toString());
      setState(() {
        loader = false;
      });
    } catch (e) {
      _toast.showToast("Sign In Failed");
      debugPrint('Sign In Failed $e');
      setState(() {
        loader = false;
      });
    }
  }
}
