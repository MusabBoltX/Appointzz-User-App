import 'package:appointz_client/Services/ColorPicker.dart';
import 'package:appointz_client/Views/Home/DotorsList/DoctorList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: cleanBlack,
                        )),
                    Text(
                      "Select the Category",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: _deptList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => const DoctorsList()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            _deptList[index],
                            style: TextStyle(
                                color: cleanWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: cleanDarkBlueGrey,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _deptList = [
    "Anesthesiology",
    "Cardiologist",
    "Dentist",
    "Family Physician",
    "Orthopaedics",
    "OPD",
    "Orthopaedics",
  ];
}
