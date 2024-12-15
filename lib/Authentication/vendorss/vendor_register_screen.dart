import 'package:flutter/material.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';

class VendorRegisterScreen extends StatefulWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

  @override
  _VendorRegisterScreenState createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  // Controllers for each TextField
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _eventManagerController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _companyNameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _eventManagerController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Validation method
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    // Basic email validation regex
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation method
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Confirm password validation
  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Registration method
  void _registerVendor() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration in progress')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Registration'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Create your vendor account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Text Fields
                _buildTextField(
                  controller: _companyNameController,
                  hintText: "Company Name",
                  icon: Icons.business,
                  validator: (value) =>
                      value!.isEmpty ? 'Company name is required' : null,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _bioController,
                  hintText: "Company Bio",
                  icon: Icons.description,
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Bio is required' : null,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _locationController,
                  hintText: "Location Link",
                  icon: Icons.location_on,
                  validator: (value) =>
                      value!.isEmpty ? 'Location is required' : null,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _eventManagerController,
                  hintText: "Event Manager Name",
                  icon: Icons.person,
                  validator: (value) =>
                      value!.isEmpty ? 'Event Manager name is required' : null,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 30),

                // Register Button
                ElevatedButton(
                  onPressed: _registerVendor,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: ColorConstants.primaryForeground,
                  ),
                  child: Text(
                    "Sign up",
                    style: TextConstants.buttonText.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable TextField builder
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: ColorConstants.primaryForeground.withOpacity(0.1),
        filled: true,
      ),
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}
