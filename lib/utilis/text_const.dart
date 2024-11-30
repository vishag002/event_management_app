// text_const.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_const.dart'; // Import color constants for consistent colors

class TextConstants {
  // App Title
  static final TextStyle appTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorConstants.textPrimary, // Primary text color
  );

  // Headline TextStyle
  static final TextStyle headline = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ColorConstants.textPrimary,
  );

  // Subheading TextStyle
  static final TextStyle subheading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorConstants.textPrimary,
  );
  // Body TextStyle
  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    // fontFamily: 'Roboto',
    color: ColorConstants.textPrimary,
  );

  // Secondary TextStyle (for lighter text, such as subtitles or descriptions)
  static TextStyle bodyTextSecondary = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    //fontFamily: 'Roboto',
    color: ColorConstants.textSecondary, // Lighter text color
  );

  // Button TextStyle
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    //fontFamily: 'Roboto',
    color: ColorConstants.buttonText, // White text for buttons
  );
  static TextStyle buttonText2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    //fontFamily: 'Roboto',
    color: ColorConstants.primaryForeground, // White text for buttons
  );
  static TextStyle buttonTextSmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    //fontFamily: 'Roboto',
    color: ColorConstants.buttonText, // White text for buttons
  );

  // Error TextStyle
  static TextStyle errorText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    //fontFamily: 'Roboto',
    color: Colors.red, // Red for error messages
  );

  // Form Label TextStyle
  static TextStyle formLabel = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    //fontFamily: 'Roboto',
    color: ColorConstants.textPrimary,
  );
  static TextStyle smallHighlightText = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    //fontFamily: 'Roboto',
    color: ColorConstants.textSecondary,
  );
}
