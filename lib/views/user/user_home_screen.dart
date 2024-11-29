import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home Screen"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: ExploreScreenList(),
        ),
      ),
    );
  }
}
