import 'SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUs> {
  String _name;
  String _email;
  String _phoneNumber;
  String _description;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }



  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {

      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int description = int.tryParse(value);

        if (description == null || description <= 0) {
          return 'Description must be greater than 10';
        }

        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),

                _buildPhoneNumber(),
                _buildDescription(),
                SizedBox(width: 10, height:25),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),

                  ),
                  color: Colors.teal,
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_description);

                    //Send to API
                  },
                ),

                SizedBox(width: 10, height:25,),
                RaisedButton(
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen()));
                    //Send to API
                  },
                ),



              ],
            ),

          ),
        ),
      ),
    );
  }
}