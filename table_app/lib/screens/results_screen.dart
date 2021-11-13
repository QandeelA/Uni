import '../main.dart';
import '/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import '/components/reusable_card.dart';
import '/constants/constants.dart';
import 'Contact_US.dart';
import 'SplashScreen.dart';
import 'input_page.dart';


InputPage aa = new InputPage();
class ResultsScreen extends StatelessWidget {
  List bmiResult= [];
  static int y=InputPage.starting_limit;
  String x;
  int e = 0;
List result()
{
  for( y=InputPage.starting_limit; y<=InputPage.ending_limit; y++)
    {
       x= ("${InputPage.Table_number}  * $y = ${InputPage.Table_number*y} \n") as String;
      bmiResult.add(x);
    }
  return bmiResult;
}
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
        title: Text('Your Table'),

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
                        image: AssetImage("Images/download.jpg"),
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
                  title: const Text('Generate Table'),

                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => BMICalculator()));
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomBottomBar(
              customBottomBarLabel: 'RE-CALCULATE YOUR TABLE',
              customBottomBarOnPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    ),
    );
  }
}
