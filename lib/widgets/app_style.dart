import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle({
  required FontWeight fontWeight,
  required Color fontColor,
  required double size,
}) {
  return GoogleFonts.poppins(
    color: fontColor,
    height: size,
    fontWeight: fontWeight,
  );
}

TextStyle appStyle2({
  required FontWeight fontWeight,
  required Color fontColor,
  required double size,
}) {
  return TextStyle(
    color: fontColor,
    height: size,
    fontWeight: fontWeight,
  );
}

TextStyle appStyleWithHeight({
  required FontWeight fontWeight,
  required Color fontColor,
  required double size,
  required double height,
}) {
  return GoogleFonts.poppins(

    fontWeight: fontWeight,
    color: fontColor,
    fontSize: size,
    height: height,
  );
}

TextStyle appStyleItalic({required FontWeight fontWeight, required double size, required double height, required Color color}){
  return GoogleFonts.italiana(
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
    height: height,
  );
}