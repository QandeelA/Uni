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
                          image: AssetImage("Images/drop.jpg"),
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
  const TipsAndNewsPage({Key? key}) : super(key: key);

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
                        "index",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    color: Colors.black45,
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
                      color: Colors.black45,
                    ),
                  ],  ),
              ),
            ], ),
        ),
      ),
    );

  }
}

