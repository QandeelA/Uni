import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_final_task/part1.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'RetrievePassword.dart';
import 'SplashScreen.dart';
import 'generatepassword.dart';
import 'main.dart';

class MyApps extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:Colors.black26,
            title: Text('Random Password Generating App'),

          ),
          drawer: Drawer(

            child: Container(
              color: Colors.black12,
              child: ListView(
                // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Images/how-to-use-a-random-password-generator_tvjd.jpg"),
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
                      title: const Text('Home'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Simple'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => GeneratePassword()));
                        // Update the state of the app.
                        // ...
                      },
                    ),

                    ListTile(
                      title: const Text('Retrieve Password'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Retrieve()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Upload Password'),

                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Retrieve()));
                        // Update the state of the app.
                        // ...
                      },
                    ),

                  ]
              ),
            ),
          ),
          backgroundColor: Colors.cyan,
          body: MyAppss(),
        )
    );
  }
}

class MyAppss extends StatefulWidget {
  @override
  _MyAppssState createState() => _MyAppssState();
}

class _MyAppssState extends State<MyAppss> {
  int chara = 2;
  int sym = 2;
  int upp = 2;
  int loww = 2;
  var valuessList = ['123456789'];
  int isWithLetters = 2;
  int isWithUppercase = 2;
  int isWithNumbers = 2;
  int isWithSpecial = 2;
  String newPassword = '';
  Color _color = Colors.blue;
  String isOk = '';
  TextEditingController _passwordLength = TextEditingController();
  final password = RandomPasswordGenerator();

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  checkBox(String name, Function onTap, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(name),
        Checkbox(value: value, onChanged: onTap),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('\n \n'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'UpperCase',
                    ),
                    DropdownButton<int>(
                        hint: Text("UpperCase" ),
                        value: upp,
                        items: <int>[2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                          return new DropdownMenuItem<int>(
                            value: value,
                            child: new Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            upp = newVal;
                            isWithUppercase = upp;
                          });
                        }),
                    Text(
                      'LowerCase',
                    ),
                    DropdownButton<int>(
                        hint: Text("LowerCase" ),
                        value: loww,
                        items: <int>[2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                          return new DropdownMenuItem<int>(
                            value: value,
                            child: new Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            loww = newVal;
                            isWithLetters = loww;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Symbols',
                    ),
                DropdownButton<int>(
                hint: Text("Symbols" ),
            value: sym,
            items: <int>[2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
              return new DropdownMenuItem<int>(
                value: value,
                child: new Text(value.toString()),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                sym = newVal;
                isWithSpecial = sym;
              });
            }),
                    Text(
                      'Characters',
                    ),
                    DropdownButton<int>(
                        hint: Text("characters" ),
                        value: chara,
                        items: <int>[2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                          return new DropdownMenuItem<int>(
                            value: value,
                            child: new Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            chara = newVal;
                            isWithNumbers= chara;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    onPressed: () {
                     newPassword = generatePassword(isWithLetters,isWithUppercase,isWithNumbers,isWithSpecial);
                     _controller.text = newPassword;
                      setState(() {});
                    },
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Generator Password',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _controller,
                  readOnly: true,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      suffixIcon: IconButton(
                          onPressed: (){
                            final data = ClipboardData(text: _controller.text);
                            Clipboard.setData(data);

                            final snackbar = SnackBar(
                                content: Text("Password Copy"));

                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(snackbar);
                          },
                          icon: Icon(Icons.copy))
                  ),
                ),
              ],
            )),
      ),
    );
  }
}