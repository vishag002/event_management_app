import 'package:event_management_app/views/user/user_bottom_nav_bar.dart';
import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                userLogin(context);
              },
              child: Text("User Login"),
            ),
            ElevatedButton(
              onPressed: () {
                vendorLogin(context);
              },
              child: Text("Vendor Login"),
            ),
          ],
        ),
      ),
    );
  }

  //UserBottomNavBar
  void userLogin(context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => UserBottomNavBar(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  //UserBottomNavBar
  void vendorLogin(context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const VendorBottomNavBar(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
