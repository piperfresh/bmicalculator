import 'package:bmicalculator/screens/input_page.dart';
import 'package:bmicalculator/widgets/app_style.dart';
import 'package:flutter/material.dart';

Widget buildChip({
 required Widget iCon,
 
  required void Function()? onTap,
  required Color color,
  required Widget widget

}) {
  return GestureDetector(
    onTap: onTap,
    child: Chip(

      backgroundColor: color,

      label: SizedBox(
        height: 40,
        width: 150,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iCon,
            const SizedBox(
              width: 6,
            ),
          widget,
         
          ],
        ),
      ),
    ),
  );
}
