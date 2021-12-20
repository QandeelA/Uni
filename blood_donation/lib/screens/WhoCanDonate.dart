import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'TipsAndNews.dart';
String d = " General \n  Who can donate blood?	\n Top \n   A blood donor must: \n  be in good general health \n  be aged 18 years or older but less than 60 years \n  weigh at least 45 Kg \n   have a hemoglobin level of at least 12.5 g/dl \n   not have donated blood in the last 3 months";

class donate extends StatelessWidget {
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
                    title: const Text('Log In'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                      // Update the state of the app.
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

                ]
            ),
          ),
        ),
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: donatePage(),
          ),
        ),
      ),
    );
  }
}

class donatePage extends StatefulWidget {
  const donatePage({Key? key}) : super(key: key);

  @override
  _donatePageState createState() => _donatePageState();
}

class _donatePageState extends State<donatePage> {
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
                      '\n Tip 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\n ${d}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
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

