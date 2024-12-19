import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';

class UserEditProfileScreen extends StatelessWidget {
  const UserEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            _inputField(
              context,
              hintText: "Enter your name",
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),
            _inputField(
              context,
              hintText: "Enter your email",
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: ColorConstants.primaryForeground,
              ),
              child: Text(
                "Confirm",
                style: TextConstants.buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    BuildContext context, {
    required String hintText,
    required IconData prefixIcon,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
