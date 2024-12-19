import 'package:flutter/material.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';

class VendorRegisterScreen extends StatefulWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

  @override
  _VendorRegisterScreenState createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  // Existing controllers
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // New controller for event manager pricing
  final TextEditingController _eventManagerPriceController =
      TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // New variable to track event manager service
  bool _providesEventManager = false;

  @override
  void dispose() {
    // Dispose all controllers
    _companyNameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _eventManagerPriceController.dispose();
    super.dispose();
  }

  // Existing validation methods (email, password, etc.)
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validate event manager price when service is provided
  String? _validateEventManagerPrice(String? value) {
    if (_providesEventManager) {
      if (value == null || value.isEmpty) {
        return 'Please enter a price for event manager service';
      }
      // Optional: Add more specific price validation if needed
      final priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
      if (!priceRegex.hasMatch(value)) {
        return 'Please enter a valid price';
      }
    }
    return null;
  }

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
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 00),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Existing header
                Text(
                  "Sign up",
                  style: TextConstants.appTitle.copyWith(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Create your vendor account",
                  style: TextConstants.formLabel.copyWith(
                    color: ColorConstants.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Existing text fields...
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
                  hintText: "Location",
                  icon: Icons.location_on,
                  validator: (value) =>
                      value!.isEmpty ? 'Location is required' : null,
                ),
                const SizedBox(height: 15),

                // New Event Manager Service Checkbox
                _eventManagerWidget(),
                // Conditional Event Manager Price Field
                if (_providesEventManager) ...[
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: _buildTextField(
                      icon: Icons.currency_rupee,
                      controller: _eventManagerPriceController,
                      hintText: " Price",
                      keyboardType: TextInputType.number,
                      validator: _validateEventManagerPrice,
                    ),
                  ),
                ],

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
                const SizedBox(height: 20),
                addLicenceImage(),
                const SizedBox(height: 20),

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
                    style: TextConstants.buttonText.copyWith(),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Existing _buildTextField method remains the same
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
        prefixIcon: Padding(
          padding: maxLines > 1
              ? const EdgeInsets.only(bottom: 40)
              : EdgeInsets.zero,
          child: Icon(icon),
        ),
        contentPadding:
            maxLines > 1 ? const EdgeInsets.fromLTRB(12, 20, 12, 12) : null,
        alignLabelWithHint: maxLines > 1,
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

  //
  Widget _eventManagerWidget() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.primaryForeground.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _providesEventManager,
            onChanged: (bool? value) {
              setState(() {
                _providesEventManager = value ?? false;
              });
            },
            activeColor: ColorConstants.primaryForeground,
          ),
          Text(
            'Provide Event Manager Service',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

Widget addLicenceImage() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorConstants.primaryForeground.withOpacity(0.1),
        border: Border.all(
          color: ColorConstants.primaryForeground,
        )),
    child: Center(
      child: Text(
        "Add License Image",
        style: TextConstants.buttonText2,
      ),
    ),
  );
}
