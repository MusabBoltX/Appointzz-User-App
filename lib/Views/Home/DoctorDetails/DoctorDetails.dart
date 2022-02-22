import 'package:flutter/cupertino.dart';
import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:appointz_client/Views/Home/DoctorBookings/PatientDetails/PatientDetails.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  double ratingScore = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

          title: Image.asset('assests/logo.png',
            color: const Color.fromRGBO(231, 232, 225, 1),
            // color: Colors.black,
            scale: 4.3,
          )),

      body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            // height: MediaQuery.of(context).size.height *1,

            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/noimagefound.jpg',
                        placeholderScale: 1,
                        image: "asset/Images/doctor.png",
                      )),
                ),

                Column(
                  children: const [
                    Text(
                      "\nDr. Stuart",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1),
                    ),
                    Text(
                      '\nGeneral Physician\n',
                      textScaleFactor: 1.0,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                /// ----- Doctor Details ------ ///
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Row(
                          children: [
                            Container(child: const Text('Degree :  ',
                              textScaleFactor: 1.0,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                                width:
                                MediaQuery.of(context).size.width * 0.7,
                                child: const Text(
                                  "MBBS",
                                  textScaleFactor: 1.0,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                      ),///--Degree

                      SizedBox(
                        height: 30,
                        // color: Colors.pinkAccent,
                        child: Row(
                          children: const [
                            Text('Consultancy Charges :  ',
                              textScaleFactor: 1.0,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text("800 Rs"),
                          ],
                        ),
                      ),///--Consultancy Price

                      SizedBox(
                        // color: Colors.brown,
                        height: 17,
                        child: Row(
                          children: [
                            Container(child: const Text('Ratings :  ',
                              textScaleFactor: 1.0,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("4.7 "),
                                  Icon(Icons.star, size: 18, color: cleanDarkBlueGrey,),
                                ],
                              ),
                            ),///--Stars
                          ],
                        ),
                      ),

                      SizedBox(
                        // color: Colors.cyan,
                        height: 30,
                        child: Row(
                          children: const [
                            Text('Availability Status: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                              textScaleFactor: 1.0,
                            ),
                            Text(
                              "Online",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),///--availability
                    ],
                  ),
                ),

                /// ----- Doctors availability ----- ///
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Doctor Availability',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),

                /// ------- Doctor Timings -------- ///
                Card(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.grey.shade400,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ListView.builder(
                              itemCount: _day.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Text(
                                      '${_day[index]} :  ',
                                      textScaleFactor: 1.0,
                                      style: const TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      '02:00 PM - ',
                                      textScaleFactor: 1.0,
                                    ),
                                    const Text(
                                      '08:00 PM ',
                                      textScaleFactor: 1.0,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),///--Time Slots
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => PatientDetailsBody()));
          },
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(7, 78, 99, 0.7),
              borderRadius: BorderRadius.circular(12),
            ),

            child: const Text(
              'Book Appointment',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),

          ),
        ),
      ),
    );
  }

  final List<String> _day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
}
