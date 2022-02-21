import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class TokenCard extends StatelessWidget {

  final String? token;
  final String? text;

  const TokenCard({Key? key, this.token, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: 170,
      child: Card(

        color: const Color.fromRGBO(7, 78, 99, 0.6),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 10, left: 10),

          child: Column(
            children: [

              CircleAvatar(
                radius: 65,
                backgroundColor: const Color.fromRGBO(231, 232, 225, 1),

                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(4.0, 8.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    color: const Color.fromRGBO(7, 78, 99, 0.8),
                    borderRadius: BorderRadius.circular(80),
                  ),

                  child: Center(
                      child: Text('$token',
                        textScaleFactor: 1.0,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: const Color.fromRGBO(231, 232, 225, 1)
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text('$text',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(231, 232, 225, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

