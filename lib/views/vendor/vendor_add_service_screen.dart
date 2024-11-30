import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class VendorAddServiceScreen extends StatefulWidget {
  const VendorAddServiceScreen({super.key});

  @override
  _VendorAddServiceScreenState createState() => _VendorAddServiceScreenState();
}

class _VendorAddServiceScreenState extends State<VendorAddServiceScreen> {
  int _currentStep = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _priceTypeController = TextEditingController();

  String _selectedPriceType = priceType[0];
  String _selectedCategory = categoryList[0];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _priceTypeController.dispose();
    super.dispose();
  }

  List<Step> _buildSteps() {
    return [
      _buildStep(
        'Enter Details',
        _enterDetailsField(),
        _currentStep >= 0,
        _currentStep == 0,
      ),
      _buildStep(
        'Add Images',
        _buildImageUploadSection(),
        _currentStep >= 1,
        _currentStep == 1,
      ),
      _buildStep(
        'Review Details',
        _reviewStepp(_titleController.text, _descriptionController.text,
            _priceTypeController.text, _priceController.text),
        _currentStep >= 2,
        _currentStep == 2,
      ),
    ];
  }

  Step _buildStep(String title, Widget content, bool isActive, bool showTitle) {
    return Step(
      title: Text(
        showTitle ? title : '',
        style: const TextStyle(
          color: ColorConstants.textPrimary,
        ),
      ),
      stepStyle: StepStyle(
          indexStyle: TextStyle(
        color: ColorConstants.lightGreyShade,
      )),
      content: content,
      isActive: isActive,
    );
  }

  Widget _buildNavigationButtons(ControlsDetails details) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: ColorConstants.lightGreyShade,
        child: _currentStep == 2
            ? _buildContinueButton(context)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: details.onStepCancel,
                  //     child: Container(
                  //       height: 50,
                  //       width: double.infinity,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           border: Border.all(
                  //             color: ColorConstants.primaryForeground,
                  //           )),
                  //       child: const Center(
                  //         child: Text(
                  //           "Back",
                  //           style: TextConstants.buttonText2,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: details.onStepContinue,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConstants.primaryForeground,
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextConstants.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyShade,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: const Text('Add Service'),
      ),
      body: Stack(
        children: [
          Theme(
            data: ThemeData(
              canvasColor: ColorConstants.lightGreyShade,
            ),
            child: Stepper(
              connectorColor: const WidgetStatePropertyAll(
                  ColorConstants.primaryForeground),
              type: StepperType.horizontal,
              currentStep: _currentStep,
              controlsBuilder: (context, details) {
                return const SizedBox.shrink();
              },
              onStepTapped: (step) {
                setState(
                  () {
                    _currentStep = step;
                  },
                );
              },
              onStepContinue: () {
                setState(
                  () {
                    if (_currentStep < 2) {
                      _currentStep += 1;
                    }
                  },
                );
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  }
                });
              },
              steps: _buildSteps(),
            ),
          ),
          // Custom navigation buttons
          _buildNavigationButtons(ControlsDetails(
            currentStep: _currentStep,
            stepIndex: _currentStep,
            onStepContinue: () {
              setState(() {
                if (_currentStep < 2) {
                  _currentStep += 1;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep -= 1;
                }
              });
            },
          )),
        ],
      ),
    );
  }

  Widget _enterDetailsField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Service Title",
              style: TextConstants.bodyText,
            ),
          ),
          CustomTextFormField(
            hintText: "Enter the title of your service",
            controller: _titleController,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Service Description",
              style: TextConstants.bodyText,
            ),
          ),
          CustomTextFormField(
            hintText: "Provide a detailed description of your service",
            controller: _descriptionController,
            maxLine: 3,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Service Category",
              style: TextConstants.bodyText,
            ),
          ),
          //CategoryDropDown(),
          categoryDropDown(
            value: _selectedCategory,
            items: categoryList,
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Service Price",
                        style: TextConstants.bodyText,
                      ),
                    ),
                    CustomTextFormField(
                      hintText: "Enter the price ",
                      controller: _priceController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Pricing Type",
                        style: TextConstants.bodyText,
                      ),
                    ),
                    buildCustomDropdown(
                      value: _selectedPriceType,
                      items: priceType,
                      onChanged: (value) {
                        setState(() {
                          _selectedPriceType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// The rest of the code remains the same (CustomTextFormField, buildCustomDropdown, etc.)
//

Widget _reviewStepp(titleController, descriptionController, priceController,
    selectedPriceType) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Service Title",
        style: TextConstants.bodyTextSecondary
            .copyWith(fontWeight: FontWeight.w500),
      ),
      Text(
        "Speaker",
        style: TextConstants.bodyText,
      ),
      const SizedBox(height: 30),
      Text(
        "Service Description",
        style: TextConstants.bodyTextSecondary,
      ),
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
        style: TextConstants.bodyText,
      ),
      /////
      const SizedBox(height: 30),
      Text(
        "Service Category",
        style: TextConstants.bodyTextSecondary,
      ),
      Text(
        "Wedding , Corporate",
        style: TextConstants.bodyText,
      ),
      ///////
      const SizedBox(height: 30),
      Text(
        "service Price",
        style: TextConstants.bodyTextSecondary,
      ),
      Text(
        "5000 per day",
        style: TextConstants.bodyText,
      ),
      const SizedBox(height: 30),

      Text(
        "Images",
        style: TextConstants.bodyTextSecondary,
      ),
      const SizedBox(height: 10),
      image_grid(),
    ],
  );
}

//
Widget _enterDetailsField(titleController, descriptionController,
    priceController, priceTypeController, _selectedPriceType) {
  String _selectedCategory = categoryList[0];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Service Title",
            style: TextConstants.bodyText,
          ),
        ),
        CustomTextFormField(
          hintText: "Enter the title of your service",
          controller: titleController,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Service Description",
            style: TextConstants.bodyText,
          ),
        ),
        CustomTextFormField(
          hintText: "Provide a detailed description of your service",
          controller: descriptionController,
          maxLine: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Service Category",
            style: TextConstants.bodyText,
          ),
        ),
        buildCustomDropdown(
          value: _selectedCategory,
          items: categoryList,
          onChanged: (value) {
            //TODO:
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align text and input to the start
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Service Price",
                        style: TextConstants.bodyText,
                      ),
                    ),
                    CustomTextFormField(
                      hintText: "Enter the price ",
                      controller: priceController,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16), // Add spacing between the two fields
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pricing Type",
                        style: TextConstants.bodyText,
                      ),
                    ),
                    buildCustomDropdown(
                      value: _selectedPriceType,
                      items: priceType,
                      onChanged: (value) {
                        //TODO:
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

///

///
Widget _buildContinueButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const VendorBottomNavBar(),
        ),
        (Route<dynamic> route) => false,
      );
      // Get.to(
      //   () => const VendorBottomNavBar(),
      //   transition: Transition.cupertinoDialog,
      //   fullscreenDialog: GetPlatform.isAndroid,
      //   duration: const Duration(milliseconds: 600),
      // );
    },
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorConstants.primaryForeground,
      ),
      child: Center(
        child: Text(
          "Submit",
          style: TextConstants.buttonText,
        ),
      ),
    ),
  );
}
//

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconTap;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.maxLine = 1,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: Colors.black,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(suffixIcon, color: Colors.grey),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent, width: .0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: ColorConstants.primaryForeground, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      ),
      maxLines: maxLine,
      style: TextConstants.bodyText,
    );
  }
}

//
Widget _buildImageUploadSection() {
  return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.primaryForeground,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              "Add Images",
              style: TextConstants.buttonText,
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      image_grid(),
    ],
  );
}

Widget image_grid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.2,
    ),
    itemCount: 4,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Icon(
            Icons.image_outlined,
            color: Colors.grey.shade500,
            size: 50,
          ),
        ),
      );
    },
  );
}

///drop down

Widget buildCustomDropdown({
  required String value,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.transparent, width: 0),
    ),
    child: CustomDropdown<String>(
      hintText: 'Select',
      items: items,
      initialItem: value,
      decoration: CustomDropdownDecoration(
        hintStyle: TextConstants.formLabel,
        headerStyle: TextConstants.formLabel,
        closedBorder: Border.all(color: Colors.transparent),
        closedFillColor: Colors.transparent,
        expandedBorder:
            Border.all(color: ColorConstants.primaryForeground, width: 1.5),
      ),
      onChanged: onChanged,
    ),
  );
}

//category dropdown

Widget categoryDropDown({
  required String value,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.transparent, width: 0),
    ),
    child: CustomDropdown<String>.multiSelect(
      enabled: true,
      hintText: "select category",
      items: items,
      initialItems: [],
      onListChanged: (value) {
        //
      },
      decoration: CustomDropdownDecoration(
        listItemDecoration: ListItemDecoration(
          highlightColor: ColorConstants.highlightBlue,
          selectedColor: ColorConstants.lightGreyShade,
          selectedIconColor: ColorConstants.primaryForeground,
          selectedIconShape: CircleBorder(),
        ),
        hintStyle: TextConstants.formLabel,
        expandedFillColor: ColorConstants.backgroundPrimary,
        headerStyle: TextConstants.formLabel,
        closedBorder: Border.all(color: Colors.transparent),
        closedFillColor: Colors.transparent,
        expandedBorder:
            Border.all(color: ColorConstants.primaryForeground, width: 1.5),
      ),
    ),
  );
}

//list
List<String> categoryList = [
  'Wedding',
  'Corporate',
  'Private Show',
  'Concert',
];

List<String> priceType = [
  'per Day',
  'per Sqfeet',
];
