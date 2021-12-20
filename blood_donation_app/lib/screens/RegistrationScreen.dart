import 'package:blood_donation_app/screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'OTP.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';


class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: RegistrationPage(),
          ),
        ),
      ),
    );
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("Images/type.png"),
    ),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
              TextFormField(
                decoration: InputDecoration(labelText: '  Email', labelStyle: TextStyle(
                    color: Colors.black, fontSize: 15
                ),),keyboardType: TextInputType.emailAddress,
               ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  Confirm Email', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  Display Name', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  Phone Number', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  City', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  Password', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '  Age', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 15
                  ),),keyboardType: TextInputType.number,
                ),
                Text(
                 '\n \n',
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
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => Otp()));
                    //Send to API
                  },
                ),
              ],
            ),
          ),


        ],
      ),
    ),
    );
  }
}
