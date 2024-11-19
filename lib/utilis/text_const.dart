// text_const.dart

import 'package:flutter/material.dart';
import 'color_const.dart'; // Import color constants for consistent colors

class TextConstants {
  // App Title TextStyle
  static const TextStyle appTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorConstants.textPrimary, // Primary text color
  );

  // Headline TextStyle
  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ColorConstants.textPrimary,
  );

  // Subheading TextStyle
  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorConstants.textPrimary,
  );

  // Body TextStyle
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ColorConstants.textPrimary,
  );

  // Secondary TextStyle (for lighter text, such as subtitles or descriptions)
  static const TextStyle bodyTextSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: ColorConstants.textSecondary, // Lighter text color
  );

  // Button TextStyle
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: ColorConstants.buttonText, // White text for buttons
  );

  // Error TextStyle
  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',

    color: Colors.red, // Red for error messages
  );

  // Form Label TextStyle
  static const TextStyle formLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: ColorConstants.textPrimary,
  );
}
