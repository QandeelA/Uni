import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

import 'components/reusable_card.dart';
import 'constants.dart';
import 'constants/constants.dart';
import 'screens/Contact_US.dart';
import 'screens/SplashScreen.dart';
import 'screens/results_screen.dart';



class BMICalculator extends StatelessWidget {
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
          title: Text('Matching App'),

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
                          image: AssetImage("Images/f.png"),
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
                          .pushReplacement(MaterialPageRoute(builder: (context) => BMICalculator()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Match Numbers'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => InputPage()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Match Alphabets'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => InputPage()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Result'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => ResultsScreen())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Contact Us'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => ContactUs()));
                      // Update the state of the app.
                      // ...
                    },
                  ),

                ]
            ),
          ),
        ),
        backgroundColor: Colors.cyan,
        body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Expanded(
    child: ReusableCard(
    colour: kActiveCardColor,
    cardChild: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'Welcome to Matching App',
    style: kLabelStyle,
    ),
      ]),
    ),
    )
    ]
    )
    )
    );
  }
}
