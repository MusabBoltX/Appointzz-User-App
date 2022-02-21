import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        elevation: 8,
        backgroundColor: const Color.fromRGBO(7, 78, 99, 0.8),

        leading: IconButton(
            icon: const Icon(
              Icons.navigate_before_rounded,
              size: 35,),
            onPressed: (){
              Navigator.of(context).pop();
            }),

        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FittedBox(
            child: Image.asset('assests/logo.png',
              color: const Color.fromRGBO(231, 232, 225, 1),
            ),
          ),
        ));
  }
}

