import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';

Widget FilterChipWidget({
  required String label,
  required bool isSelected,
  required void Function(bool) onSelected,
}) {
  return ChoiceChip(
    shadowColor: Colors.black,
    showCheckmark: false,
    backgroundColor: ColorConstants.highlightBlueLightest,
    selectedColor: ColorConstants.primaryForeground,
    label: Text(
      label,
      style: TextConstants.buttonTextSmall.copyWith(
        color: isSelected
            ? ColorConstants.backgroundPrimary
            : ColorConstants.primaryForeground,
      ),
    ),
    selected: isSelected, // Check if the chip is selected
    onSelected: onSelected, // Callback when the chip is selected
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30), // Border radius of 30
    ),
    padding: EdgeInsets.symmetric(
        vertical: 6, horizontal: 20), // Adjust height and padding
  );
}
