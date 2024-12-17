import 'package:flutter/material.dart';

// Colors
Color text = const Color(0XFF35325E);
Color textSecondary = const Color(0XFF90909E);
Color blue = const Color(0XFF8EC9F5);
Color purple = const Color(0XFFADAEFF);
Color red = const Color(0XFFFDEBEA);
Color grey = const Color.fromARGB(255, 221, 240, 255);
Color green = const Color.fromARGB(255, 209, 249, 237);
Color softgreen = const Color.fromARGB(255, 233, 243, 229);
Color primary = const Color(0xFF6DA06F);
Color white = const Color(0XFFFFFFFF);

// Typography
TextStyle regular10 = const TextStyle(fontSize: 10);
TextStyle regular14 = regular10.copyWith(fontSize: 14);

// TextStyle medium14 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
// TextStyle medium16 = medium14.copyWith(fontSize: 16);
// TextStyle medium18 = medium14.copyWith(fontSize: 18);

final TextStyle medium18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
  color: text, // Add the color directly here
);

final TextStyle medium16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
  color: text,
);

final TextStyle medium14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: text,
);
