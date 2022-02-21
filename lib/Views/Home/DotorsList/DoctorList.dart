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
              size: 35,),
            onPressed: (){
              Navigator.of(context).pop();

            }),
        backgroundColor: const Color.fromRGBO(7, 78, 99, 0.7),
        title: Image.asset(
          'assests/logo.png',
          color: const Color.fromRGBO(231, 232, 225, 1),
          // color: Colors.black,
          scale: 4.3,
        ),

        // -- Search Bar -- //
        bottom: PreferredSize(
          preferredSize: const Size(80, 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  width: MediaQuery.of(context).size.width * 1,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      focusColor: Colors.transparent,
                      disabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Color.fromRGBO(231, 232, 225, 1),
                      filled: true,
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.77,
                // padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return DoctorCard(
                        title: 'Dr Stuart',
                        descriptions: 'MBBS',
                        img: 'asset/Images/doctor.png',
                      );
                    })),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
