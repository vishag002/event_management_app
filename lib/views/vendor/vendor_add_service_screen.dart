import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorAddServiceScreen extends StatelessWidget {
  const VendorAddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Add Service"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.checkmark_alt,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            //add title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "add Title",
                style: TextConstants.subheading,
              ),
            ),
            ListTile(
              title: // Example usage
                  CustomTextField(
                controller: titleController,
                hintText: 'Add title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            //add description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Discription",
                style: TextConstants.subheading,
              ),
            ),
            ListTile(
              title: // Example usage
                  CustomTextField(
                controller: descriptionController,
                hintText: 'Add description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            //add rate
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Rate",
                style: TextConstants.subheading,
              ),
            ),
            ListTile(
              title: // Example usage
                  CustomTextField(
                controller: priceController,
                hintText: 'Add Service rate',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      "Add Image",
                      style: TextConstants.buttonText,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    // child: Text(
                    //   'Item $index',
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final int? maxLines;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        // Black and white theme
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      maxLines: maxLines,
      onChanged: onChanged,
      style: TextConstants.bodyText,
      cursorColor: Colors.black,
    );
  }
}
