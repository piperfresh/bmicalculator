import 'package:bmicalculator/screens/input_page.dart';
import 'package:bmicalculator/widgets/app_style.dart';
import 'package:bmicalculator/widgets/chip_card.dart';
import 'package:bmicalculator/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender {
  male,
  female,
}

class ResultPage extends StatefulWidget {
  ResultPage({
    Key? key,
    required this.genderPicked,
    required this.height,
    required this.weight,
    required this.interpretation,
    required this.calculation,
  }) : super(key: key);
   Gender? genderPicked;
  late final double height;
  late final double weight;
  final String interpretation;
  final String calculation;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFFFFF),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.refresh,
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
                                  color: widget.genderPicked == Gender.male
                                      ? kInactiveColor
                                      : kActiveColor,
                                ),
                                widget: Text(
                                  'Male',
                                  style: TextStyle(
                                      color: widget.genderPicked == Gender.male
                                          ? kInactiveColor
                                          : kActiveColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.genderPicked = Gender.male;
                                  });
                                },
                                color: widget.genderPicked == Gender.male
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
                                  color: widget.genderPicked == Gender.female
                                      ? kInactiveColor
                                      : kActiveColor,
                                ),
                                // text: 'Female',
                                widget: Text(
                                  'Female',
                                  style: TextStyle(
                                      color:
                                          widget.genderPicked == Gender.female
                                              ? kInactiveColor
                                              : kActiveColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.genderPicked = Gender.female;
                                  });
                                },
                                color: widget.genderPicked == Gender.female
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
                        vaLUE: double.parse('${widget.height}'),
                        onchanged: (newValue) {
                          setState(() {
                            widget.height = newValue;
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
                        vaLUE: widget.weight,
                        onchanged: (newValue) {
                          setState(() {
                            widget.weight = newValue;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 220,
                ),
                Text(
                  'Your Bmi                                                                         ',
                  style: appStyle2(
                      fontWeight: FontWeight.bold,
                      fontColor: const Color(0xffE8495B),
                      size: 0),
                ),
                Text(
                  '   ${widget.calculation}                                                    ',
                  style: appStyleItalic(
                      fontWeight: FontWeight.normal,
                      size: 40,
                      height: 0,
                      color: const Color(0xffE8495B)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.interpretation,
                  softWrap: false,
                  maxLines: 1,
                  style: appStyleItalic(
                      fontWeight: FontWeight.normal,
                      size: 15,
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
