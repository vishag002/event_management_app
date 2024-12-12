import 'package:event_management_app/Authentication/login_new.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(),
                const SizedBox(height: 30),
                _passwordField(),
                const SizedBox(height: 20),
                _confirmPasswordField(),
                const SizedBox(height: 30),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Set Your Password",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Create a strong password to secure your account.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.lock),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required.";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters.";
        }
        return null;
      },
    );
  }

  Widget _confirmPasswordField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.lock_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password.";
        } else if (value != passwordController.text) {
          return "Passwords do not match.";
        }
        return null;
      },
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          Get.snackbar(
            "Password Updated",
            "You can use your new password to log in.",
            snackPosition: SnackPosition.BOTTOM,
          );
          // Navigate to the login screen
          Future.delayed(const Duration(seconds: 1), () {
            Get.to(() => const LoginPage());
          });
        }
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.primaryForeground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            "Update",
            style: TextConstants.buttonText,
          ),
        ),
      ),
    );
  }
}
