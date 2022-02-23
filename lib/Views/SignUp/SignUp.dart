import 'dart:ui';
import 'package:appointz_client/Views/Helpers/progress_hud.dart';
import 'package:appointz_client/Views/Home/HomePage.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'SignUp_Button.dart';


class SignUp extends StatefulWidget {
  /// --- Third Receiver --- ///
  final String? id;
  final String? doctorSpeciality;
  final String? experience;
  final String? degree;
  final String? doctorImage;
  final String? doctorId;
  final String? doctorName;
  final String? doctorNameLast;
  final String? doctorFees;

  const SignUp({Key? key,
    this.doctorFees,
    this.id,
    this.doctorImage,
    this.degree,
    this.experience,
    this.doctorId,
    this.doctorName,
    this.doctorNameLast,
    this.doctorSpeciality,
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  String country = '';
  String? setNumber;

  void setCountry(CountryCode? value) {
    country = value!.toCountryStringOnly();
    debugPrint(country);
    debugPrint("cccccc");
    setNumber = value.toString();
    debugPrint('set number $setNumber');
    debugPrint(country);
  }


  /// ========= Controllers ========= ///
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();

  bool loader = false;

  final _auth = FirebaseAuth.instance;

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
            // height: MediaQuery.of(context).size.height*1,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),

            child: Column(
              children: [
                const Text(
                  '\nSign Up\n',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(7, 78, 99, 0.8),
                letterSpacing: 0.7,
                  ),
                ),

                /// --- Full Name
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
                                Icons.person,
                                color: Color.fromRGBO(7, 78, 99, 0.7),
                              ),
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextField(
                                maxLines: 1,
                                selectionWidthStyle: BoxWidthStyle.tight,
                                controller: nameController,
                                cursorColor: const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'First Name',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                /// --- Email
                Container(height: 20),

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
                                cursorColor: const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                /// --- Pass
                Container(height: 20),

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
                                cursorColor: const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'Password',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                /// --- Confirm Pass
                Container(height: 20),

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
                                controller: confirmPassController,
                                cursorColor: const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: const InputDecoration(
                                    hintText: 'Confirm Password',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                // --- Country
                Container(height: 20),

                Theme(
                  data: ThemeData(primaryColor: Colors.transparent),
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Card(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      color: Colors.white,
                      child: CountryCodePicker(
                        favorite: const ['+92'],
                        onInit: setCountry,
                        onChanged: setCountry,
                        initialSelection: '+92',
                        showCountryOnly: true,
                        flagWidth: 30,
                        alignLeft: false,
                        showOnlyCountryWhenClosed: true,
                      ),
                    ),
                  ),
                ),

                /// --- Phone Number
                Container(height: 20),

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
                                Icons.smartphone,
                                color: Color.fromRGBO(7, 78, 99, 0.7),
                              ),
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextField(
                                maxLines: 1,
                                selectionWidthStyle: BoxWidthStyle.tight,
                                controller: phoneController,
                                cursorColor: const Color.fromRGBO(7, 78, 99, 0.7),
                                decoration: InputDecoration(
                                    hintText: 'Phone',
                                    prefix: Text(
                                        setNumber == null ? "" : setNumber.toString()),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(left: 7)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),

                Container(height: 25),

                SignUpButton(
                  onTapAction: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                          builder: (context) => const HomePage()),
                          (Route<dynamic> route) => false,
                    );
                  },
                ),

                Container(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _signUp() async {

    setState(() {
      loader = true;
    });

    try {

    } on SocketException {
      debugPrint('Sign Up Failed Sockets Suspension');
      setState(() {
        loader = false;
      });

    } on HttpException {
      debugPrint('Sign Up Failed Http request failed');
      setState(() {
        loader = false;
      });
    } on FirebaseAuthException catch (firebaseError) {
      debugPrint(firebaseError.toString());
      setState(() {
        loader = false;
      });
    } catch (e) {
      debugPrint('Sign Up Failed $e');
      setState(() {
        loader = false;
      });
    }
  }
}
