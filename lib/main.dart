import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'utilis/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme, // Use the custom theme from theme.dart
      debugShowCheckedModeBanner: false,
      home: VendorBottomNavBar(),
    );
  }
}
