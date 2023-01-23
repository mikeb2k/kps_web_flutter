import 'package:flutter/material.dart';

class KPSColors {
  static const colorKPS = Color(0xFFffbb00);
  static const colorFB = Color(0xFF3b5998);
  static const colorIG = Color(0xFF8a3ab9);
  static const colorWH = Color(0xFF25D366);
  static const colorTG = Color(0xFF2AABEE);

  static Map<int, Color> colorList = {
    0: Colors.red,
    1: Colors.yellow,
    2: Colors.green,
    3: Colors.blue,
    4: Colors.orange,
    5: colorKPS
  };

  static List<DropdownMenuItem> colorDropDown = const [
    DropdownMenuItem(
        value: "red",
        child: Icon(
          Icons.square_rounded,
          color: Colors.red,
        )),
    DropdownMenuItem(
        value: "yellow",
        child: Icon(
          Icons.square_rounded,
          color: Colors.yellow,
        )),
    DropdownMenuItem(
        value: "green",
        child: Icon(
          Icons.square_rounded,
          color: Colors.green,
        )),
    DropdownMenuItem(
        value: "blue",
        child: Icon(
          Icons.square_rounded,
          color: Colors.blue,
        )),
    DropdownMenuItem(
        value: "orange",
        child: Icon(
          Icons.square_rounded,
          color: Colors.orange,
        )),
    DropdownMenuItem(
        value: "colorKPS",
        child: Icon(
          Icons.square_rounded,
          color: colorKPS,
        ))
  ];

  static Color getColor(String color) {
    if (color == "red") {
      return Colors.red;
    } else if (color == "yellow") {
      return Colors.yellow;
    } else if (color == "green") {
      return Colors.green;
    } else if (color == "blue") {
      return Colors.blue;
    } else if (color == "orange") {
      return Colors.orange;
    } else {
      return colorKPS;
    }
  }
}
