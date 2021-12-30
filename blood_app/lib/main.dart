
import 'package:flutter/material.dart';
import 'screens/Login.dart';
import 'screens/Registration.dart';
import 'screens/SplashScreen.dart';

class blooddonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFB71C1C),
        scaffoldBackgroundColor: Color(0xFFD50000),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('Blood Donation App'),
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
                    title: const Text('Register'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Registration())); // Update the state of the app.
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
            child: blooddonationPage(),
          ),
        ),
      ),
    );
  }
}
class blooddonationPage extends StatefulWidget {
  const blooddonationPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<blooddonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Images/home.jpg"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Blood Donation App',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\n',
                          ),
                          RawMaterialButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            fillColor: Colors.deepOrangeAccent,
                            elevation: 10.0,
                            constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                              //Send to API
                            },
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\n',
                          ),
                          RawMaterialButton(
                            child: Text(
                              'Registration',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            fillColor: Colors.deepOrangeAccent,
                            elevation: 10.0,
                            constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => Registration()));
                              //Send to API
                            },
                          ),
                        ],
                      ),
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
