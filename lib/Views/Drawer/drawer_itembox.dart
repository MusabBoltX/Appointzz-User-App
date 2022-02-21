import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:flutter/material.dart';

class DrawerItemBox extends StatelessWidget {

  final blockName, blockIcon, blockTapAction;
  const DrawerItemBox({Key? key, @required this.blockName, @required this.blockIcon, @required this.blockTapAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: blockTapAction,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 16, 0, 16),
            child: Icon(blockIcon, color: cleanWhite),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              blockName,
              textScaleFactor: 1.0,
              style: TextStyle(
                  color: cleanWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
