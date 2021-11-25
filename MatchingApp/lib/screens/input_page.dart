import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import '../SplashScreen.dart';
import '../calculator_brain.dart';
import '../components/reusable_card.dart';
import '../constants/constants.dart';
import '../components/custom_bottom_bar.dart';
import '../main.dart';
import 'Contact_US.dart';

CalculatorBrain cal = new CalculatorBrain();
class InputPage extends StatefulWidget {
static int score;
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.black26,
        title: Text('Match Match and Match'),

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
                        image: AssetImage("Images/images.jpg"),
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
                    '${cal.firstnumber()}',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        ' ',
                        style: kNumberStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Starting Limit',
                          style: kLabelStyle,
                        ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomBar(
            customBottomBarLabel: 'Result',
            customBottomBarOnPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsScreen()
                  ));
            },
          ),
        ],
      ),
    );
  }
}
