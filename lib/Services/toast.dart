import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMsg {

  /// Scaffold messenger
  void showMessenger(ctx, msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: msg),
    );
  }

  /// Flutter Toast
  void showToast(msg){
    Fluttertoast.showToast(msg: msg);
  }

}
