import 'package:event_management_app/Authentication/login_new.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundPrimary,
      body: SingleChildScrollView(
        child: Container(
          color: ColorConstants.backgroundPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor:
                            ColorConstants.primaryForeground.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor:
                            ColorConstants.primaryForeground.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor:
                          ColorConstants.primaryForeground.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor:
                          ColorConstants.primaryForeground.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: ColorConstants.primaryForeground,
                    ),
                    child: Text("Sign up",
                        style: TextConstants.buttonText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
              const Center(child: Text("Or")),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: ColorConstants.primaryForeground,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.imgbin.com/17/10/21/google-suite-icon-google-icon-LmAAJV07.jpg"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 18),
                      const Text(
                        "Sign In with Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.primaryForeground,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(color: ColorConstants.primaryForeground),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
