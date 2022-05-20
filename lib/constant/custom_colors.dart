import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: CustomColors.themeColor,
    cursorColor: CustomColors.themeColor,
    accentColor: CustomColors.themeColor,
    // fontFamily: 'arial',
    focusColor: CustomColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(color: Colors.white),

  );
}
IconThemeData selectednavigationRailIconTheme(){
  return const IconThemeData(
      color: CustomColors.themeColor,
      size: 45
  );
}
IconThemeData unselectednavigationRailIconTheme(){
  return const IconThemeData(
    color: CustomColors.themeColor,
  );
}


class CustomColors {
  static const themeColor = Color(0xff3057a0);
  static const brightGreen = Color(0xff16E32A);
  static const brightOrange = Color(0xffFF8412);
  static const darkOrange = Color(0xffE97000);
  static const darkGreenShade1 = Color(0xff19b792);
  static const navyBlue = Color(0xff060D67);
  static const darkGreenShade2 = Color(0xff00AC30);
  static const darkGreenShade3 = Color(0xff06872A);
  static const darkBlue = Color(0xff0037C5);
  static const skyBlue = Color(0xff7BA0FF);
  static const darkGrey = Color(0xffC5C5C5);
  static const lightGrey = Color(0xffD9D9D9);
  static const lightOrange = Color(0x5cff8412);
  static const lightskyBlue = Color(0x687ba0ff);
  static const cBackground = Color(0xfff6f4f4);
  static const cWhite = Colors.white;
  static const cAnccent = Color(0xffBEBEBE);
}


class AppStyles {
  static const textstyle = TextStyle(
    color: CustomColors.brightGreen,
    fontSize: 9,
  );
  static const navbarActiveTextStyle = TextStyle(
      color: CustomColors.brightGreen,
      fontSize: 17,
      fontWeight: FontWeight.w500
  );

}
