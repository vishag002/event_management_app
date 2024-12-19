// text_const.dart

import 'package:flutter/material.dart';
import 'color_const.dart'; // Import color constants for consistent colors

class TextConstants {
  // App Title
  static final TextStyle appTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorConstants.textPrimary, // Primary text color
  );

  // Headline TextStyle
  static final TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'Helvetica',
    color: ColorConstants.textPrimary,
  );

  // Subheading TextStyle
  static final TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Helvetica',
    color: ColorConstants.textPrimary,
  );
  // Body TextStyle
  static TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Helvetica',
    color: ColorConstants.textPrimary,
  );

  // Secondary TextStyle (for lighter text, such as subtitles or descriptions)
  static TextStyle bodyTextSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Helvetica',
    color: ColorConstants.textSecondary, // Lighter text color
  );

  // Button TextStyle
  static TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Helvetica',
    color: ColorConstants.buttonText, // White text for buttons
  );
  static TextStyle buttonText2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    //fontFamily: 'Roboto',
    color: ColorConstants.primaryForeground, // White text for buttons
  );
  static TextStyle buttonTextSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Helvetica',
    color: ColorConstants.buttonText, // White text for buttons
  );

  // Error TextStyle
  static TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Helvetica',
    color: Colors.red, // Red for error messages
  );

  // Form Label TextStyle
  static TextStyle formLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Helvetica',
    color: ColorConstants.textPrimary,
  );
  static TextStyle smallHighlightText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Helvetica',
    color: ColorConstants.textSecondary,
  );
}
