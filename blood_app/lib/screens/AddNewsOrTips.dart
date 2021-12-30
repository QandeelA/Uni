import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'DonorHome.dart';
import 'DonorLogin.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';
import 'package:open_file/open_file.dart';

class Add extends StatelessWidget {
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
            child: AddPage(),
          ),
        ),
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}
class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                            child: Text(
                              'Add/Edit',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            fillColor: Colors.deepOrangeAccent,
                            elevation: 10.0,
                            constraints: BoxConstraints.tightFor(width: 150.0, height: 150.0),
                            shape: CircleBorder(),
                            onPressed: () {

                            }
                        ),
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Images/type.png"),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),);

  }
}

