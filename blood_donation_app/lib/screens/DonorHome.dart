import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'DonorLogin.dart';
import 'Profile.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'package:excel/excel.dart';

class DonorHome extends StatelessWidget {
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
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => ProfileApp())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Request for Blood'),
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DonorHomePage(),
          ),
        ),
      ),
    );
  }
}

class DonorHomePage extends StatefulWidget {

  @override
  _DonorHomePageState createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {

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
                     '\n \n \n ',
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       RaisedButton(
                         child: Text(
                           'Detail',
                           style: TextStyle(color: Colors.white, fontSize: 15),
                         ),
                         elevation: 10.0,
                         color: Colors.deepOrangeAccent,
                         onPressed: () async {
                           /* Your blah blah code here */
                         //  ByteData data = await rootBundle.load("Assests/Donors.xlsx");
                          // var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
                         //  var excel = Excel.decodeBytes(bytes);
                         //  for (var table in excel.tables.keys) {
                         //    for (var row in excel.tables[table]!.rows) {
                          //     print("$row");
                         //    }
                         //  }

                           Navigator.of(context)
                               .pushReplacement(MaterialPageRoute(builder: (context) => ProfileApp()));
                           //Send to API
                         },
                       ),

                     ],
                   ),
                 ],),
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
                      '\n \n \n ',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Detail',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          elevation: 10.0,
                          color: Colors.deepOrangeAccent,

                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor()));
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
                      '\n \n \n ',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Detail',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          elevation: 10.0,
                          color: Colors.deepOrangeAccent,

                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => LoginDonor()));
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

