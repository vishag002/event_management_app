import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class VendorAddServiceScreen extends StatefulWidget {
  const VendorAddServiceScreen({Key? key}) : super(key: key);

  @override
  _VendorAddServiceScreenState createState() => _VendorAddServiceScreenState();
}

class _VendorAddServiceScreenState extends State<VendorAddServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();
    final TextEditingController _priceController = TextEditingController();

    String _selectedPriceType = priceType[0];
    String _selectedCategory = categoryList[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Add Service", style: TextConstants.appTitle),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.checkmark_alt,
                color: Colors.black, size: 30),
            onPressed: _saveService,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Service Title"),
              _buildCustomTextField(
                controller: _titleController,
                hintText: 'Enter service title',
                validator: _validateNotEmpty,
              ),
              SizedBox(height: 16),
              _buildSectionTitle("Description"),
              _buildCustomTextField(
                controller: _descriptionController,
                hintText: 'Describe your service',
                maxLines: 3,
                validator: _validateNotEmpty,
              ),
              SizedBox(height: 16),
              _buildSectionTitle("Price"),
              _buildCustomTextField(
                controller: _priceController,
                hintText: 'Enter service price',
                keyboardType: TextInputType.number,
                validator: _validateNotEmpty,
              ),
              SizedBox(height: 16),
              _buildSectionTitle("Price Type"),
              _buildCustomDropdown(
                value: _selectedPriceType,
                items: priceType,
                onChanged: (value) {
                  setState(() {
                    _selectedPriceType = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              _buildSectionTitle("Category"),
              _buildCustomDropdown(
                value: _selectedCategory,
                items: categoryList,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 24),
              _buildImageUploadSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextConstants.subheading,
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextConstants.bodyTextSecondary,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildCustomDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomDropdown<String>(
        hintText: 'Select',
        items: items,
        initialItem: value,
        decoration: CustomDropdownDecoration(
          hintStyle: TextConstants.bodyTextSecondary,
          headerStyle: TextConstants.formLabel,
          closedBorder: Border.all(color: Colors.transparent),
          closedFillColor: Colors.transparent,
          expandedBorder: Border.all(color: Colors.black, width: 1.5),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstants.primaryForeground,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
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
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
      ],
    );
  }

  String? _validateNotEmpty(String? value) {
    return value == null || value.isEmpty ? 'This field cannot be empty' : null;
  }

  void _saveService() {
    //todo:- Implement save service logic
    print('Service saved');
    Navigator.pop(context);
  }
}

// Existing lists remain the same
const List<String> categoryList = [
  'Wedding',
  'Corporate',
  'Private Show',
  'Concert',
];

const List<String> priceType = [
  'per Day',
  'per Sqfeet',
];
