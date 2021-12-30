import 'package:blood_donation_app/screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('Submit Your OTP '),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Images/data.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '\n OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(

                child: GestureDetector(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          //controller: _value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter OTP here !!!",
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      //  color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              RawMaterialButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
        )
    );
  }
}
