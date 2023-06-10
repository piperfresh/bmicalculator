import 'package:bmicalculator/screens/input_page.dart';
import 'package:bmicalculator/widgets/app_style.dart';
import 'package:flutter/material.dart';

Widget buildChip({
 required Widget iCon,
  // IconData? icon,
  // required String text,
  required void Function()? onTap,
  required Color color,
  required Widget widget
  // required Color bgColor
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
            // Icon(
            //   icon,
            //   color: kPrimaryColor,
            //   size: 30,
            // ),
            iCon,
            const SizedBox(
              width: 6,
            ),
          widget,
          //   Text(
          //     textAlign: TextAlign.center,
          //     text,
          //     style: appStyleWithHeight(
          //       fontWeight: FontWeight.w600,
          //       fontColor: kPrimaryColor,
          //       size: 20,
          //       height: 0,
          //     ),
          //   ),
          ],
        ),
      ),
    ),
  );
}
