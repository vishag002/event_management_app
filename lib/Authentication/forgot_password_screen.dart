import 'package:event_management_app/Authentication/otp_pinput_screen.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundPrimary,
      ),
      body: Container(
        color: ColorConstants.backgroundPrimary,
        margin: const EdgeInsets.all(24),
        height: MediaQuery.of(context).size.height - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _header(context),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            _inputField(context),
          ],
        ),
      ),
    );
  }
}

_header(context) {
  return Column(
    children: [
      Text(
        "Forgot Password",
        style: TextConstants.appTitle.copyWith(
          fontSize: 40,
        ),
      ),
      Text(
        "Enter your Email",
        style: TextConstants.formLabel.copyWith(
          color: ColorConstants.textSecondary,
        ),
      ),
    ],
  );
}

_inputField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
            hintText: "email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.email)),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * .05),
      ElevatedButton(
        onPressed: () {
          Get.to(ForgotPassWordOtpScreen());
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: ColorConstants.primaryForeground,
        ),
        child: Text(
          "Send OTP",
          style: TextConstants.buttonText,
        ),
      )
    ],
  );
}
