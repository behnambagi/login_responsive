import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          )),
      primaryColor: const Color(0xffAB46D2),
      //Color(0xffa8d400),
      primaryColorLight: const Color(0xffa157bf),
      //Color(0xffe6ff8b),
      primaryColorDark: const Color(0xff3F497C),
      //Color(0xFFF44336),
      hintColor: const Color(0xff828282),
      backgroundColor: const Color(0xfff4f4f4),
      highlightColor: const Color(0xfff4f4f4),
      dividerColor: const Color(0xfff1f1f1),
      //disabledColor: Color(0xfff4f4f4),
      fontFamily: 'poppin',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00ffffff),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffF44336)),
    );

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          )),
      primaryColor: const Color(0xff0D73D7),
      //Color(0xffa8d400),
      primaryColorLight: const Color(0xff329EF9),
      //Color(0xffe6ff8b),
      primaryColorDark: Colors.grey.shade100,
      //Color(0xFFF44336),
      hintColor: Colors.grey.shade400,
      highlightColor: const Color(0xfff4f4f4),
      dividerColor: const Color(0x20f1f1f1),
      //disabledColor: Color(0xfff4f4f4),
      fontFamily: 'poppin',
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00ffffff),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black26),
    );

extension ExtraColors on ThemeData {
  Color get listItemsBackgroundColor => brightness == Brightness.light
      ? const Color(0xffF1F5FF)
      : backgroundColor; //;
  Color get listItemsBackgroundColor2 =>
      brightness == Brightness.light ? Colors.white : backgroundColor; //;
  Color get secondDividerColor => const Color(0xffE3E3E3);

  Color get textFieldGradientColor => brightness == Brightness.light
      ? const Color(0xfff9f9f9)
      : backgroundColor;
// Color get lightColor=>Color(0xfff4f4f4);
}