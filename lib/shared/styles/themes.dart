import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

  ThemeData darkTheme= ThemeData(
   scaffoldBackgroundColor:HexColor('333739'),
   primarySwatch: defaultColor,
   // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //    backgroundColor: HexColor('333739'),
    //   ),
   iconTheme: const IconThemeData(
    color: Colors.black,
  ),
   appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),//HexColor('333739')
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739') ,
      statusBarIconBrightness: Brightness.light,

    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,


    ),
  ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey ,
    elevation: 20.0,
    backgroundColor:HexColor('333739'),

  ),
   textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,

    ),


  ),
   fontFamily: 'Jannah',
);

  ThemeData lightTheme= ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor:Colors.white,
    //floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //       backgroundColor: Colors.blue,
    //     ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      backwardsCompatibility: false,


      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:  Colors.white,
        statusBarIconBrightness: Brightness.dark,

      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,


      ),


    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(


      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey ,
      elevation: 20.0,
      backgroundColor:Colors.white,

    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
         color: Colors.black,

      ),


    ),
    fontFamily: 'Jannah',
  );