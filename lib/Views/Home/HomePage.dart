import 'package:appointz_client/Views/Home/Appointment%20Room/appointment_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:appointz_client/Views/Drawer/DrawerItems.dart';
import 'package:flutter/material.dart';
import 'Helpers/TokenCard.dart';
import 'Specialitites/category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 8,
            backgroundColor: const Color.fromRGBO(7, 78, 99, 0.8),
            title: Image.asset(
              'assests/logo.png',
              color: const Color.fromRGBO(231, 232, 225, 1),
              // color: Colors.black,
              scale: 4.3,
            )),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Token Cards //
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: const [
                        TokenCard(
                          token: '067',
                          text: 'Current Token \nNumber',
                        ),
                        TokenCard(
                          token: '314',
                          text: 'Your Token \nNumber',
                        ),
                      ],
                    ),
                    // const Text(
                    //   '\nEstimated Remaining Time',
                    //   textScaleFactor: 1.0,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 24, color: Colors.black54),
                    // ),
                    // const Text(
                    //   '02 Hours 15 Minutes',
                    //   textScaleFactor: 1.0,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 20, color: Colors.black54),
                    // ),
                  ],
                ),
              ),

              SizedBox(
                child: Image.asset('asset/Images/report.png', scale: 1.5),
                // height: MediaQuery.of(context).size.height * 0.3,
              ),

              // Find Doctors //
              buttonCard(
                "      Find Doctor Now",
                () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CategoryScreen()));
                },
              ),

              const SizedBox(height: 15),
              buttonCard(
                "      Appointment Room",
                    () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Meeting()));
                },
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonCard(text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: 75,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: const Color.fromRGBO(7, 78, 99, 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(231, 232, 225, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const Icon(
                Icons.navigate_next_rounded,
                color: Color.fromRGBO(231, 232, 225, 1),
                size: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
