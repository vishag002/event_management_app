import 'package:event_management_app/Authentication/forgot_password_screen.dart';
import 'package:event_management_app/Authentication/user_register_screen.dart';
import 'package:event_management_app/Authentication/vendorss/vendor_register_screen.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_bottom_nav_bar.dart';
import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorConstants.backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                _header(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                _inputField(context, userNameController, passwordController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                Column(
                  children: [
                    _forgotPassword(context),
                    _guestUserSignIn(context),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context, userNameController, passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: userNameController,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Get.offAll(
            //   const UserBottomNavBar(),
            //   transition: Transition.cupertino,
            //   fullscreenDialog: GetPlatform.isAndroid,
            //   duration: const Duration(milliseconds: 600),
            // );
            handleLogin(
              context,
              userNameController.text,
              passwordController.text,
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: ColorConstants.primaryForeground,
          ),
          child: Text(
            "Login",
            style: TextConstants.buttonText,
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return InkWell(
      onTap: () {
        Get.to(
          ForgotPasswordScreen(),
        );
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: ColorConstants.primaryForeground),
      ),
    );
  }

  _guestUserSignIn(context) {
    return InkWell(
      onTap: () {
        Get.offAll(
          const UserBottomNavBar(),
          transition: Transition.cupertino,
          fullscreenDialog: GetPlatform.isAndroid,
          duration: const Duration(milliseconds: 600),
        );
      },
      child: const Text(
        "Sign in as a guest",
        style: TextStyle(color: ColorConstants.primaryForeground),
      ),
    );
  }

  _signup(context) {
    return Column(
      children: [
        /// User sign up
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account? "),
            InkWell(
              onTap: () {
                Get.to(
                  () => SignupPage(),
                  transition: Transition.cupertino,
                  fullscreenDialog: GetPlatform.isAndroid,
                  duration: const Duration(milliseconds: 600),
                );
              },
              child: const Text(
                "Sign up",
                style: TextStyle(color: ColorConstants.primaryForeground),
              ),
            )
          ],
        ),

        /// Vendor sign up
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have a vendor account? "),
            InkWell(
              onTap: () {
                Get.to(
                  () => VendorRegisterScreen(),
                  transition: Transition.cupertino,
                  fullscreenDialog: GetPlatform.isAndroid,
                  duration: const Duration(milliseconds: 600),
                );
              },
              child: const Text(
                "Sign up",
                style: TextStyle(color: ColorConstants.primaryForeground),
              ),
            )
          ],
        ),
      ],
    );
  }

////login function
  void handleLogin(
      BuildContext context, String enteredUsername, String enteredPassword) {
    // Define user credentials
    const String userUsername = "user";
    const String userPassword = "123";

    const String vendorUsername = "vendor";
    const String vendorPassword = "123";

    // Check entered credentials
    if (enteredUsername == userUsername && enteredPassword == userPassword) {
      // Navigate to UserBottomNavBar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserBottomNavBar()),
      );
    } else if (enteredUsername == vendorUsername &&
        enteredPassword == vendorPassword) {
      // Navigate to VendorBottomNavBar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VendorBottomNavBar()),
      );
    } else {
      // Show error dialog for incorrect credentials
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Failed"),
          content: Text("Invalid username or password. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}

//google sign in widget
// Widget googleSignInWidget() {
//   return Container(
//     height: 50,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25),
//       border: Border.all(
//         color: ColorConstants.primaryForeground,
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.white.withOpacity(0.5),
//           spreadRadius: 1,
//           blurRadius: 1,
//           offset: const Offset(0, 1), // changes position of shadow
//         ),
//       ],
//     ),
//     child: TextButton(
//       onPressed: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 30.0,
//             width: 30.0,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(
//                       "https://cdn.imgbin.com/17/10/21/google-suite-icon-google-icon-LmAAJV07.jpg"),
//                   fit: BoxFit.cover),
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 18),
//           const Text(
//             "Sign In with Google",
//             style: TextStyle(
//               fontSize: 16,
//               color: ColorConstants.primaryForeground,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
