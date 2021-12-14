import 'package:blood_donation_app/screens/AdminLogin.dart';
import 'package:blood_donation_app/screens/RegistrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'DonorHome.dart';
import 'DonorLogin.dart';
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
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\n \n \n \n \n'),
                TextFormField(
                  decoration: InputDecoration(labelText: '\t Email', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 20
                  ),),keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '\t Password', labelStyle: TextStyle(
                      color: Colors.black, fontSize: 20
                  ),),keyboardType: TextInputType.text,
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
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => DonorHome()));
                    //Send to API
                  },
                ),Text(
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
        ],
      ),
    )
    );
  }
}
