import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:bmicalculator/widgets/app_style.dart';
import 'package:bmicalculator/widgets/chip_card.dart';
import 'package:bmicalculator/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kPrimaryColor = Color(0xffEA5566);
const kInactiveColor = Color(0xffF2A59E);
const kActiveColor = Colors.white;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender? genderPicked;
  double height = 50;
  double weight = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/dec.jpg'), fit: BoxFit.fill),
            ),
          ),
          Positioned(
              // height: 30,
              bottom: 215,
              right: 20,
              child: Card(
                shape: const CircleBorder(),
                elevation: 2,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 120,
                      maxWidth: 120,
                      minHeight: 100,
                      minWidth: 100),
                  child: GestureDetector(
                    onTap: () {
                      CalculatorBrain calculatorBrain = CalculatorBrain(
                        height: height,
                        weight: weight,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultPage(
                              calculation: calculatorBrain.calculateBmi(),
                              height: height,
                              weight: weight,
                              genderPicked: null,
                              interpretation:
                                  calculatorBrain.getInterpretation(),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFFFFF),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.longArrowRight,
                        size: 50,
                        color: Color(0xffE8495B),
                      ),
                    ),
                  ),
                ),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'GENDER',
                  style: appStyle2(
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.white,
                      size: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          // color: Colors.white,
                        ),
                        width: 350,
                        // height: 200,
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Flexible(
                              child: buildChip(
                                // icon: FontAwesomeIcons.mars,
                                iCon: Icon(
                                  FontAwesomeIcons.mars,
                                  color: genderPicked == Gender.male
                                      ? kInactiveColor
                                      : kActiveColor,
                                ),
                                widget: Text(
                                  'Male',
                                  style: TextStyle(
                                      color: genderPicked == Gender.male
                                          ? kInactiveColor
                                          : kActiveColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    genderPicked = Gender.male;
                                  });
                                },
                                color: genderPicked == Gender.male
                                    ? kActiveColor
                                    : kInactiveColor,
                                // bgColor: activeColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: buildChip(
                                // icon: FontAwesomeIcons.venus,
                                iCon: Icon(
                                  FontAwesomeIcons.venus,
                                  color: genderPicked == Gender.female
                                      ? kInactiveColor
                                      : kActiveColor,
                                ),
                                // text: 'Female',
                                widget: Text(
                                  'Female',
                                  style: TextStyle(
                                      color: genderPicked == Gender.female
                                          ? kInactiveColor
                                          : kActiveColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    genderPicked = Gender.female;
                                  });
                                },
                                color: genderPicked == Gender.female
                                    ? kActiveColor
                                    : kInactiveColor,
                                // bgColor: activeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'HEIGHT',
                  style: appStyle2(
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.white,
                      size: 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                      height: 80,
                      child: SliderClass(
                        min: 50,
                        max: 300,
                        vaLUE: double.parse('${height}'),
                        onchanged: (newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                      )),
                ),
                Text(
                  'WEIGHT',
                  style: appStyle2(
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.white,
                      size: 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                      height: 80,
                      child: SliderClass(
                        min: 5,
                        max: 60,
                        vaLUE: double.parse('$weight'),
                        onchanged: (newValue) {
                          setState(() {
                            weight = newValue;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 220,
                ),
                Text(
                  'Body Mass Index, or BMI, is used to determine whether \n    you are in a healthy weight range for your height',
                  style: appStyle2(
                      fontWeight: FontWeight.w300,
                      fontColor: const Color(0xffE8495B),
                      size: 0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '* This calculator shouldn\'t be used for pregnant women or children',
                  style: appStyleItalic(
                      fontWeight: FontWeight.normal,
                      size: 10,
                      height: 0,
                      color: const Color(0xffE8495B)),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
