import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'colors.dart';
class CustomThemes
{
  static final lighttheme=ThemeData(
    cardColor: Colors.white,
    fontFamily: "poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Vx.gray800,
    iconTheme: const IconThemeData(
      color: Vx.gray600,
    )

  );
  static final darktheme=ThemeData(
    cardColor: bgColor,
      fontFamily: "poppins",
      scaffoldBackgroundColor: bgColor,
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.white,
      )

  );
}