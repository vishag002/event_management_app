import 'package:flutter/material.dart';
import 'color_const.dart'; // Import the color constants

ThemeData appTheme = ThemeData(
  primaryColor: ColorConstants.primaryForeground, // Primary color
  scaffoldBackgroundColor: ColorConstants.primaryWhite, // Background color
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.primaryWhite, // App bar color
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: ColorConstants.buttonBackground, // Custom button color
  ),
  iconTheme: const IconThemeData(
    color: ColorConstants.primaryForeground, // Icon color
  ),
);
