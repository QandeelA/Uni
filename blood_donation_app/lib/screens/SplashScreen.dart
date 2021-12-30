import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreen(),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("Images/spalsh.png")),
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds:2), onDoneLoading);
  }
  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => blooddonation()));
  }
}
