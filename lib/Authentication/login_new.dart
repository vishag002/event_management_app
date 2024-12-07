import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Animation
                        Lottie.asset(
                          'assets/coin.json',
                          height: 120,
                        ),

                        const SizedBox(height: 16),

                        // Title
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Login Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Username Field
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  hintText: 'Username or Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username or email';
                                  } else if (value.length < 4) {
                                    return 'At least 4 characters required';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 16),

                              // Password Field
                              Obx(
                                () => TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility
                                          // simpleUIController.isObscure.value
                                          //     ? Icons.visibility
                                          //     : Icons.visibility_off,
                                          ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'At least 6 characters required';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // primary: Colors.deepPurpleAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // TODO: Handle login logic
                                    }
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Sign-up Redirect
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to sign-up page
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Dont have an account?',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: 'Sign up',
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
