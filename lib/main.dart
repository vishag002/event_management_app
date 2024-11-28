import 'package:event_management_app/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utilis/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme, // Use the custom theme from theme.dart
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
