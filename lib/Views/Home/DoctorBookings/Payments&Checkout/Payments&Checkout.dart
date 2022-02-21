import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, Toast, ToastGravity;
import 'package:http/http.dart' as http;


class Payment extends StatefulWidget {
  final String? order;
  final String? amount;

  const Payment({Key? key, this.order, this.amount}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  String? paymentType;
  bool loader = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.navigate_before_rounded,
              size: 35,),
            onPressed: (){
              Navigator.of(context).pop();
            }),
        backgroundColor: Color.fromRGBO(7, 78, 99, 0.7),
      ),

      body: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 1,
          // color: Colors.red,

          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 0),
            child: Column(
              children: <Widget>[

                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    '\nPlease select appropriate method of payment\n\n',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                  ),
                ),

                Container(height: 100),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},

                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color.fromRGBO(7, 78, 99, 0.7), width: 2.0),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                // color: Colors.grey,
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  child: Image.asset(
                                    'asset/Images/wallet11.png',
                                    color: Color.fromRGBO(7, 78, 99, 0.7),
                                    scale: 1.0,
                                    width: 30.0,
                                    height: 25.0,
                                  )),
                              Container(
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Center(
                                  child: Text(
                                    "CASH ON DELIVERY",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(fontSize: 15.0, color: Color.fromRGBO(7, 78, 99, 0.7), fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              border: Border.all(color: Color.fromRGBO(7, 78, 99, 0.7), width: 2.0),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  // color: Colors.grey,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    child: Image.asset(
                                      'asset/Images/easypaisa.png',
                                      scale: 1.0,
                                      width: 30.0,
                                      height: 25.0,
                                    )),
                                Container(
                                  // color: Colors.blue,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: Text(
                                      "EASY PAISA",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(fontSize: 15.0, color: Color.fromRGBO(7, 78, 99, 0.7), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              border: Border.all(color: Color.fromRGBO(7, 78, 99, 0.7), width: 2.0),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  // color: Colors.grey,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    child: Image.asset(
                                      'asset/Images/jazzcash.png',
                                      scale: 1.0,
                                      width: 30.0,
                                      height: 25.0,
                                    )),
                                Container(
                                  // color: Colors.blue,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: Text(
                                      "JAZZ CASH",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(7, 78, 99, 0.7)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

