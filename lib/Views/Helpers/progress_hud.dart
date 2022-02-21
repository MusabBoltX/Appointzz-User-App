import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:flutter/material.dart';

class ProgressHUD extends StatefulWidget {
  final Widget child;
  final bool inAsyncCall;
  final Color color;

  const ProgressHUD({
    Key? key,
    required this.child,
    required this.inAsyncCall,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  _ProgressHUDState createState() => _ProgressHUDState();
}

class _ProgressHUDState extends State<ProgressHUD> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(widget.child);

    if (widget.inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: false,
              color: widget.color,
            ),
          ),
          Center(
            child: SizedBox(
              width: 150,
              // height: 70,
              child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CircularProgressIndicator(
                          backgroundColor: cleanDarkBlueGrey,
                          valueColor: AlwaysStoppedAnimation<Color>(cleanWhite),
                        ),
                      ),
                      SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset('assests/logo.png')),
                      const SizedBox(width: 20),
                    ],
                  )),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
