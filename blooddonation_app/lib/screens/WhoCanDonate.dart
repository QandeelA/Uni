import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'TipsAndNews.dart';
String d = "Generally: \nWho can donate blood?\nA blood donor must: \n  --> be in good general health \n  -->  be aged 18 years or older but less than 60 years \n   --> weigh at least 45 Kg \n   --> have a hemoglobin level of at least 12.5 g/dl \n   --> not have donated blood in the last 3 months";

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
                          image: AssetImage("Images/data.png"),
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
  const donatePage({Key key}) : super(key: key);

  @override
  _donatePageState createState() => _donatePageState();
}

class _donatePageState extends State<donatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 550,
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 550,
                    width: 400,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "$d",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),

                    ),
                    color: Colors.black45,
                  ),
                ),
              ),
            ], ),
        ),
      ),
    );
  }
}

