import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../main.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';
import 'brain.dart';

FirebaseDatabase database  = FirebaseDatabase.instance;
functionality obj =functionality();
TextEditingController _codeController= TextEditingController();
String num = "+92";

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
                          image: AssetImage("Images/data.png"),
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
  const RegistrationPage({Key key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView (
        child:  Column(
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
                    IntlPhoneField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                    /*TextField(
                    controller: numberController,
                    decoration: InputDecoration(labelText: ' Phone Number', labelStyle: TextStyle(
                        color: Colors.black, fontSize: 15
                    ),
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+92'),
                      ),
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,



                  ),*/

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
                    FlatButton(
                      color:  Colors.deepOrangeAccent,
                      child: const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          "Get OTP",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      shape: CircleBorder(),
                      onPressed: () {
                        print("checked");
                        num = num + numberController.text;
                        final mobile = numberController.text.trim();
                        registerUser(mobile, context);
                        /* Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => OTPScreen(phone)));*/
                        //Send to API
                      },
                    ),
                  ],
                ),
              ),

              ),

            ),
          ],
        ),
      ),
    );

  }
}
Future registerUser(String mobile, BuildContext context) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCredential authCredential;
  _auth.verifyPhoneNumber(
      phoneNumber: num,
      timeout: Duration(seconds: 120),
      verificationCompleted: (authCredential){
        _auth.signInWithCredential(authCredential).then((UserCredential result){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Login_Page()
          ));
        }).catchError((e){
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException){
        print(authException.message);
      },
      codeSent: (String verificationId, [int forceResendingToken]){
        //show dialog to take input from the user
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter SMS Code"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _codeController,
                  ),

                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Done"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    String smsCode = _codeController.text.trim();
                    authCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                    auth.signInWithCredential(authCredential).then((UserCredential result){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Login_Page()
                      ));
                    }).catchError((e){
                      print(e);
                    });
                  },
                )
              ],
            )
        );
      },
      codeAutoRetrievalTimeout: (String verificationId){
        verificationId = verificationId;
        print(verificationId);
        print("Timout");
      }
  );
}
