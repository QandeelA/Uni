import 'dart:typed_data';
import 'AdminLogin.dart';
import 'DonorHome.dart';
import 'Registration.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class Login_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('Login '),
        ),
        drawer: Drawer(
          child: Container(

            color: Colors.red,
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Images/data.png"),
                          fit: BoxFit.cover,
                        )
                    ), child: null,
                  ),
                  ListTile(
                    title: const Text('SplashScreen'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Registration Page'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Registration()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Tips and News'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => TipsAndNews())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Who can Donate?'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => donate()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ]
            ),
          ),
        ),
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Login_PagePage(),
          ),
        ),
      ),
    );
  }
}
class Login_PagePage extends StatefulWidget {
  @override
  _Login_PagePageState createState() => _Login_PagePageState();
}

class _Login_PagePageState extends State<Login_PagePage> {
  String x = "C://Users//khali//Downloads/Blood.xlsx";
  TextEditingController _value = TextEditingController();
  TextEditingController _value2 = TextEditingController();
  var value, pass;
  var e, p;
  List<dynamic> f;
  Future<int> log()  async {

    ByteData data = await rootBundle.load("Images/Blood.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table].maxCols);
      print(excel.tables[table].maxRows);
      for (var row in excel.tables[table].rows) {
        print("$row");
        //f =  excel.tables[table].;

        print("hi");
    }
    }
  }
 /* Future<int> log()
  async {
    ByteData data = await rootBundle.load("${x}");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        print("$row");
      }
    }
    return 1;
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView (
          child: Container(
            margin: EdgeInsets.only(top: 175),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Images/hearts_blood_drive-01.jpg"),
              ),
            ),
            child: Expanded(
              child: Column(
                children: [

                  TextField(
                    controller: _value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email here!",
                    ),
                  ),
                  TextField(
                    controller: _value2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter your password here!",
                    ),
                  ),
                  Text(
                    '\n \n ',
                  ),
                  RawMaterialButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    fillColor: Colors.deepOrangeAccent,
                    elevation: 10.0,
                    constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
                    shape: CircleBorder(),
                    onPressed: () {
                      value = _value.text;
                      pass = _value2.text;
                      e=value;
                      print(value);
                      print(pass);
                      log();
                       Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => DonorHome()));
                      //Send to API
                    },
                  ),

                  RawMaterialButton(
                    child: Text(
                      'AdminSite',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    fillColor: Colors.deepOrangeAccent,
                    elevation: 10.0,
                    constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
                    shape: CircleBorder(),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => AdminHome()));
                      //Send to API
                    },
                  ),
                ],
              ),
            ),
          ),
        )

      //], ),
    );
  }
}
