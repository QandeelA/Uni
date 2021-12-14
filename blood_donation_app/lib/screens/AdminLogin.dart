import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'AddNewsOrTips.dart';
import 'DonorHome.dart';
import 'DonorLogin.dart';
import 'Login.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('HomePage '),
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
                    title: const Text('View Donors'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => DonorHome())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Edit Database'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Tips and news'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => TipsAndNews()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Add Tips or news'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Add()));
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
                  ListTile(
                    title: const Text('Log Out'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => blooddonation()));
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
            child:
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                     child: AdminHomePage(),
            ),
        ),
      ),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '\n Profile 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\n ',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          elevation: 10.0,
                          shape: CircleBorder(),
                          color: Colors.deepOrangeAccent,

                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor()));
                            //Send to API
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Del',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          elevation: 10.0,
                          shape: CircleBorder(),
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                            //Send to API
                          },
                        ),

                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                child: Column(

                  children: <Widget>[
                    Text(
                      '\n Profile 2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\n ',

                    ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             RaisedButton(
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              elevation: 10.0,
                              shape: CircleBorder(),
                              color: Colors.deepOrangeAccent,

                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor()));
                                //Send to API
                              },
                            ),
                          RaisedButton(
                              child: Text(
                                'Del',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              elevation: 10.0,
                              shape: CircleBorder(),
                              color: Colors.deepOrangeAccent,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                                //Send to API
                              },
                            ),

                          ],
                        ),


                  ],
                ),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '\n Profile 3',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\n ',

                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          elevation: 10.0,
                          shape: CircleBorder(),
                          color: Colors.deepOrangeAccent,

                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor()));
                            //Send to API
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            'Del',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          elevation: 10.0,
                          shape: CircleBorder(),
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                            //Send to API
                          },
                        ),

                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
       );
  }
}

