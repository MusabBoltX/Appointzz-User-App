import 'package:flutter/material.dart';
import 'HelperCard/DoctorCard.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 232, 225, 1),
      appBar: AppBar(
        centerTitle: true,
        elevation: 8,
        leading: IconButton(
            icon: const Icon(
              Icons.navigate_before_rounded,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: const Color.fromRGBO(7, 78, 99, 0.7),
        title: Image.asset(
          'assests/logo.png',
          color: const Color.fromRGBO(231, 232, 225, 1),
          // color: Colors.black,
          scale: 4.3,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            // height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\nCurrently Available Doctor: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "Dr. Stuart",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Text(
                  "Current Token Number: 003\n",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const DoctorCard(
                    title: 'Dr Stuart',
                    descriptions: 'MBBS',
                    img: 'asset/Images/doctor.png',
                  );
                }),
          ),
        ],
      ),
    );
  }
}
