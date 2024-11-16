import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              "My Services",
              style: TextConstants.appTitle,
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipWidget(
                  label: "All",
                  isSelected: selectedFilter == 'All',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                const SizedBox(width: 8),
                FilterChipWidget(
                  label: "Active",
                  isSelected: selectedFilter == 'Active',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'Active';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChipWidget(
                  label: "Pending",
                  isSelected: selectedFilter == 'Pending',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'Pending';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget FilterChipWidget({
  required String label,
  required bool isSelected,
  required void Function(bool) onSelected,
}) {
  return ChoiceChip(
    showCheckmark: false, // Disables the checkmark for a cleaner look
    backgroundColor:
        Colors.grey[200], // Default background color (non-selected)
    selectedColor: Colors.black, // Color when selected
    label: Text(
      label,
      style: TextStyle(
        color: isSelected
            ? Colors.white
            : Colors.black, // Text color when selected or unselected
      ),
    ),
    selected: isSelected, // Check if the chip is selected
    onSelected: onSelected, // Callback when the chip is selected
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Border radius of 30
    ),
    padding: EdgeInsets.symmetric(
        vertical: 6, horizontal: 20), // Adjust height and padding
  );
}
