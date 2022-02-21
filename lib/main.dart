import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Views/LogReg/LogReg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyAppointzz());
}

class MyAppointzz extends StatelessWidget {
  const MyAppointzz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointzz',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // InternetChecker _internetChecker = InternetChecker();
  @override
  void initState() {
    super.initState();
    // _internetChecker.connectionStatus();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => const LogReg()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 78, 99, 0.8),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Image.asset(
              'assests/logo.png',
              color: const Color.fromRGBO(231, 232, 225, 1),
              // color: Colors.black,
              scale: 1.7,
            ),
            const Text('A One Click Hospital',
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(231, 232, 225, 1),
                    letterSpacing: 1.0,
                    fontSize: 16,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
