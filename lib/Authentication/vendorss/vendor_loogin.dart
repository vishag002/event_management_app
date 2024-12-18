// import 'package:event_management_app/Authentication/forgot_password_screen.dart';
// import 'package:event_management_app/Authentication/vendorss/vendor_register_screen.dart';
// import 'package:event_management_app/utilis/color_const.dart';
// import 'package:event_management_app/utilis/text_const.dart';
// import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VendorLoginScreen extends StatelessWidget {
//   const VendorLoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.backgroundPrimary,
//       body: Container(
//         margin: const EdgeInsets.all(24),
//         color: ColorConstants.backgroundPrimary,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _header(context),
//             _inputField(context),
//             _forgotPassword(context),
//             _signup(context),
//           ],
//         ),
//       ),
//     );
//   }

//   _header(context) {
//     return const Column(
//       children: [
//         Text(
//           "Welcome Back",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//         ),
//         Text("Enter your credential to login"),
//       ],
//     );
//   }

//   _inputField(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//               hintText: "Username",
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//               fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
//               filled: true,
//               prefixIcon: const Icon(Icons.person)),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Password",
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//             fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
//             filled: true,
//             prefixIcon: const Icon(Icons.password),
//           ),
//           obscureText: true,
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//             Get.offAll(
//               const VendorBottomNavBar(),
//               transition: Transition.cupertino,
//               fullscreenDialog: GetPlatform.isAndroid,
//               duration: const Duration(milliseconds: 600),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             backgroundColor: ColorConstants.primaryForeground,
//           ),
//           child: Text(
//             "Login",
//             style: TextConstants.buttonText,
//           ),
//         )
//       ],
//     );
//   }

//   _forgotPassword(context) {
//     return TextButton(
//       onPressed: () {
//         Get.to(ForgotPasswordScreen());
//       },
//       child: const Text(
//         "Forgot password?",
//         style: TextStyle(color: ColorConstants.primaryForeground),
//       ),
//     );
//   }

//   _signup(context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Dont have an account? "),
//         TextButton(
//           onPressed: () {
//             Get.to(VendorRegisterScreen());
//           },
//           child: const Text(
//             "Sign Up",
//             style: TextStyle(color: ColorConstants.primaryForeground),
//           ),
//         )
//       ],
//     );
//   }
// }
