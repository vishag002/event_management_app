import 'package:flutter/material.dart';
import 'color_const.dart'; // Import the color constants

ThemeData appTheme = ThemeData(
  primaryColor: ColorConstants.primaryBlack, // Primary color
  scaffoldBackgroundColor: ColorConstants.backgroundPrimary, // Background color
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorConstants.backgroundPrimary, // App bar color
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: ColorConstants.buttonBackground, // Custom button color
  ),
  iconTheme: const IconThemeData(
    color: ColorConstants.backgroundPrimary, // Icon color
  ),
);
