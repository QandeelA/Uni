import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'WhoCanDonate.dart';

class TipsAndNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.black26,
          title: Text('Tips '),
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
                    title: const Text('LogIn Page'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page())); // Update the state of the app.
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TipsAndNewsPage(),
          ),
        ),
      ),
    );
  }
}

class TipsAndNewsPage extends StatefulWidget {
  const TipsAndNewsPage({Key key}) : super(key: key);

  @override
  _TipsAndNewsPageState createState() => _TipsAndNewsPageState();
}

class _TipsAndNewsPageState extends State<TipsAndNewsPage> {
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Container(
                      height: 550,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "\n\n->Eating regularly before donating will help to keep your blood sugar levels stable.\n\n->This is important so that you don’t feel lightheaded or dizzy after your donation.\n\n->Having a snack before you donate can help maintain these blood sugar levels.\n\n->Ensuring that your diet contains foods rich in iron\n - such as meats and green leafy vegetables\n - will help to keep you feeling well during and after donation.",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                      color: Colors.cyan,
                    ),
                    Container(
                      height: 550,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "index",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      color: Colors.cyan,
                    ),
                  ],  ),
              ),
            ], ),
        ),
      ),
    );

  }
}

