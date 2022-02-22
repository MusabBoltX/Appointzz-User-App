import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:appointz_client/Views/Home/DoctorBookings/PatientDetails/PatientDetails.dart';
import 'package:appointz_client/Views/Home/DoctorDetails/DoctorDetails.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final String? title, descriptions;
  final String? img;

  const DoctorCard({Key? key, this.descriptions, this.img, this.title})
      : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 1),
                  blurRadius: 5,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // -- Data Items & Image -- //
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // -- Avatar -- //
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: Constants.avatarRadius,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(Constants.avatarRadius)),
                            child: Image.asset("asset/Images/doctor.png",
                                scale: 1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title.toString(),
                          textScaleFactor: 1.0,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      Text(widget.descriptions.toString(),
                          textScaleFactor: 1.0,
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 5),

                      ///--Ratings
                      SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("4.7 "),
                            Icon(
                              Icons.star,
                              color: cleanDarkBlueGrey,
                              size: 18,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),

              // -- Buttons -- //
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const DoctorDetails()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: cleanDarkBlueGrey,
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        color: Color.fromRGBO(231, 232, 225, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => PatientDetailsBody()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: cleanDarkBlueGrey,
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        color: Color.fromRGBO(231, 232, 225, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Constants {
  Constants._();

  static const double padding = 40;
  static const double avatarRadius = 40;
}
