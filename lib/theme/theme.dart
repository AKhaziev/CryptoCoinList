import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  // useMaterial3: true,
  appBarTheme:  const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 50, 50, 50),

      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
);

