import 'dart:typed_data';
import 'package:blood_donation_app/screens/AdminLogin.dart';
import 'package:blood_donation_app/screens/RegistrationScreen.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';

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
                          image: AssetImage("Images/drop.jpg"),
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
  TextEditingController _value = TextEditingController();
  TextEditingController _value2 = TextEditingController();
  late var value, pass;
  Future<int> log()
  async {
     ByteData data = await rootBundle.load("Assests/Donors.xlsx");
     var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {

       }
     }
    return 1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView (
               child: Container(
                 margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Images/type.png"),
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
                    print(value);
                    print(pass);
                   /* Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => DonorHome()));*/
                    //Send to API
                  },
                ),
                    Text(
                  '\n \n ',
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
