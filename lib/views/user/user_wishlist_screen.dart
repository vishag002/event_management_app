import 'package:flutter/material.dart';

class UserWishListScreen extends StatelessWidget {
  const UserWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites Screen"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
