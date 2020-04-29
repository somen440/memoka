import 'package:flutter/material.dart';

class MemocaColors {
  static const List<Color> colors = <Color>[
    Color(0xFF005D57),
    Color(0xFF04B97F),
    Color(0xFF37EFBA),
    Color(0xFF007D51),
  ];

  static const gray60 = Color(0x99D8D8D8);
  static const dividerColor = Color(0xAA282828);
  static const gray = Color(0xFFD8D8D8);
  static const primaryBackground = Color(0xFF33333D);
  static const focusColor = Color(0xCCFFFFFF);
  static const inputBackground = Color(0xFF26282F);
  static const cardBackground = Color(0x03FEFEFE);
  static const white60 = Color(0x99FFFFFF);

  static const sw = Color(0xffD90012);
  static const ps4 = Color(0xff4149A5);
  static const xbox = Color(0xff255041);
  static const pc = Color(0xff2A2D6F);
  static const ios = Colors.black;
  static const android = Color(0xff7FB117);
  static const etc = Color(0xff138CE3);

  static Color cycledColor(int i) {
    return colors[i % colors.length];
  }
}
