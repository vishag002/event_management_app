import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';

class UserSearchScreen extends StatelessWidget {
  const UserSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          searchWidget(),
        ],
      ),
    );
  }
}
