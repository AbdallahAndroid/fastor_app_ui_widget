import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




final appTheme = ThemeData(

  useMaterial3: true,


  //------------------------------------------ background

  scaffoldBackgroundColor: Colors.black,


  //------------------------------------------ app bar

  appBarTheme:  AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.black,
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
  ),

  //------------------------------------------ status bar

  brightness: Brightness.dark,

  //------------------------------------------ calender

  colorScheme:   ColorScheme.dark(
    primary: Colors.black,  //calender circle range background
    onPrimary: Colors.green,  //calender select button + calender day selected text color
    onSurface: Colors.black,  //calender month name text
  ),

  datePickerTheme:   DatePickerThemeData(

    //-------------- date picker single date
    backgroundColor: Colors.green,
    headerForegroundColor: Colors.white,

    //-------------- date picker range
    rangePickerBackgroundColor: Colors.green,  //background
    rangePickerHeaderForegroundColor: Colors.green, // text header

  ),

  //------------------------------------------ progress

  progressIndicatorTheme:  ProgressIndicatorThemeData(color: Colors.green),

  //------------------------------------------ buttons

  primaryColor: Colors.green,
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  ),

  //------------------------------------------ input

  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle:  TextStyle(color: Colors.green),
    iconColor: Colors.black,
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  //------------------------------------------ text

  // fontFamily: FontResources.mediumHellix,
  textTheme:  TextTheme(
    labelLarge: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),

    titleLarge: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
    titleSmall: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: Colors.grey, fontSize: 15),
  ),
);

