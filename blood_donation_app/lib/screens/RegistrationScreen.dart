import 'package:blood_donation_app/screens/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../main.dart';
import 'OTP.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';

final FirebaseDatabase database  = FirebaseDatabase.instance;
class Registration extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('Register '),
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
                    title: const Text('Login Page'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Home'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => blooddonation()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Tips And News'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => TipsAndNews()));
                      // Update the state of the app.
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
        body: Center(
           child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
             child: Padding(

               padding: EdgeInsets.symmetric(horizontal: 10.0),
               child: RegistrationPage(),
          ),
        ),
      ),
    ),);
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _phone = new TextEditingController();
    late var phone;
    int minNumber = 1000;
    int maxNumber = 6000;
    String countryCode ="+92";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          SingleChildScrollView (
        child: Container(
          margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("Images/type.png"),
    ),
    ), child:
             Expanded(
            child: Column(
              children: [
              TextField(
                decoration: InputDecoration(labelText: '  Email', labelStyle: TextStyle(
                    color: Colors.black, fontSize: 15
                ),),keyboardType: TextInputType.emailAddress,
               ),
                TextField(
                  decoration: InputDecoration(labelText: '  Confirm Email', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '  Display Name', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(labelText: '  Phone Number',  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+92'),
                  ), labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),maxLength: 10, keyboardType: TextInputType.phone,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '  City', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '  Password', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '  Age', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.number,
                ),
                Text(
                 '\n',
                ),
                RawMaterialButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  fillColor: Colors.deepOrangeAccent,
                  elevation: 10.0,
                  constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
                  shape: CircleBorder(),
                  onPressed: () {
                    phone = _phone.text;
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => Otp(phone)));
                    //Send to API
                  },
                ),
              ],
            ),
          ),

    ),

    ),
],
    ),);

  }
}
