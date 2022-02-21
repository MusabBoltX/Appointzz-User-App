import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  final onTapAction;

  const SignUpButton({
    Key? key,
    @required this.onTapAction,
  }) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 50,
      child: RaisedButton(
        color: const Color.fromRGBO(7, 78, 99, 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: widget.onTapAction,
        child: const Text(
          'SIGN UP',
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
      ),
    );
  }
}
