import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // * Primary Color

  static const green700 = Color(0xff89A34C);
  static const green500 = Color(0xffA2BA00);
  static const green300 = Color(0xffC7D951);
  static const green100 = Color(0xffF4FEE5);
  static Color dynamicPrimary1 = green700;
  static Color dynamicPrimary2 = green500;
  static Color dynamicPrimary3 = green300;
  static Color dynamicPrimary4 = green100;

  // * Accent Color

  static const blue500 = Color(0xFF3C6D9B);
  static const blue300 = Color(0xFF608AB2);
  static Color dynamicAccent1 = blue500;
  static Color dynamicAccent2 = blue300;

  static const red500 = Color(0xFFCE3235);
  static const red300 = Color(0xFFF0BFC0);
  static Color dynamicAccent3 = blue500;
  static Color dynamicAccent4 = blue300;

  // * Neutral Color

  static const gray700 = Color(0xff565555);
  static const gray500 = Color(0xffA8A8A8);
  static const gray300 = Color(0xffBDBDBD);
  static const gray200 = Color(0xffE7E7E7);
  static const gray100 = Color(0xffF5F5F5);

  static const black = Color(0xff212121);
  static const white = Color(0xffFFFFFF);

  // * TEXT STYLE

  static TextStyle headline = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 21,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle subtitle1 = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle subtitle2 = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle subtitle3 = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: black,
  );

  static TextStyle body1 = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: black,
  );

  static TextStyle body2 = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: black,
  );

  static TextStyle caption = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: black,
  );

  static TextStyle inputText = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    color: black,
  );

  static TextStyle buttonText = const TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    color: white,
  );

  // * Date Picker Theme

  static TextTheme datePickerTextTheme = TextTheme(
    headline5: AppTheme.subtitle1, // Selected Date landscape
    headline6: AppTheme.subtitle2,

    /// Selected Date portrait
    headline4: AppTheme.subtitle1,
    overline: AppTheme.caption, // Title - SELECT DATE
    bodyText1: AppTheme.body1, // year gridbview picker
    bodyText2: AppTheme.body2,
    subtitle1: AppTheme.body1, // input
    subtitle2: AppTheme.subtitle3, // month/year picker
    caption: AppTheme.caption, // days
  );
  static ColorScheme datePickerColorScheme = ColorScheme.light(
    primary: AppTheme.dynamicPrimary2, // header background color
    surface: Colors.white, // header text color
    onSurface: AppTheme.black, // body text color
  );

  static TextButtonThemeData datePickerTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(textStyle: AppTheme.subtitle3),
  );
}
