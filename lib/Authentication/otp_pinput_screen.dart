import 'package:event_management_app/Authentication/new_password_screen.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ForgotPassWordOtpScreen extends StatefulWidget {
  const ForgotPassWordOtpScreen({super.key});

  @override
  State<ForgotPassWordOtpScreen> createState() =>
      _ForgotPassWordOtpScreenState();
}

class _ForgotPassWordOtpScreenState extends State<ForgotPassWordOtpScreen> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String correctOtp = "1234"; // Replace with your backend-provided OTP

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorConstants.backgroundPrimary,
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                _header(),
                const SizedBox(height: 40),
                _pinputField(),
                const SizedBox(height: 20),
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
          "Verification",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Enter the 4-digit code sent to your email/phone.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _pinputField() {
    return Pinput(
      length: 4,
      onTapOutside: (event) {
        //
      },
      focusedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.primaryForeground),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.highlightBlue,
        ),
      ),
      controller: pinController,
      focusNode: focusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter the OTP.";
        } else if (value != correctOtp) {
          return "Invalid OTP. Please try again.";
        }
        return null;
      },
      onChanged: (value) {
        // You can handle real-time validation or other logic here
      },
      onCompleted: (value) {
        if (value == correctOtp) {
          Get.snackbar("Success", "OTP Verified!");
        }
      },
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Get.snackbar(
            "OTP Verified",
            "You will be redirected shortly!",
            snackPosition: SnackPosition.BOTTOM,
          );
          // Navigate to the next screen
          Future.delayed(const Duration(seconds: 1), () {
            Get.to(
                () => NewPasswordScreen()); // Replace with your target screen
          });
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorConstants.primaryForeground,
      ),
      child: Text(
        "Verify & Proceed",
        style: TextConstants.buttonText.copyWith(fontSize: 20),
      ),
    );
  }
}
