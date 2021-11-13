import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../constants/constants.dart';
import '../components/round_icon_button.dart';
import '../components/custom_bottom_bar.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {

  static int Table_number = 1;
  static int starting_limit = 1;
  static int ending_limit = 10;
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Table Number',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        InputPage.Table_number.toString(),
                        style: kNumberStyle,
                      ),

                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Colors.white,
                      activeTrackColor: Colors.tealAccent,
                    ),
                    child: Slider(
                      value: InputPage.Table_number.toDouble(),
                      min: 1.0,
                      max: 200.0,
                      // activeColor: Colors.tealAccent,
                      onChanged: (double newValue) {
                        // print(newValue);
                        setState(() {
                          InputPage.Table_number = newValue.round();
                        });
                      },
                    ),
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
                        Text(
                          InputPage.starting_limit.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    InputPage.starting_limit--;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    InputPage.starting_limit++;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ending Limit',
                          style: kLabelStyle,
                        ),
                        Text(
                          InputPage.ending_limit.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    InputPage.ending_limit--;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                customButtonPress: () {
                                  setState(() {
                                    InputPage.ending_limit++;
                                  });
                                },
                                customButtonIcon: FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomBar(
            customBottomBarLabel: 'Display Table',
            customBottomBarOnPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(Table_number: InputPage.Table_number, starting_limit: InputPage.starting_limit, ending_limit: InputPage.ending_limit);
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
