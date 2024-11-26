import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class EnhancedCategoryDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  const EnhancedCategoryDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: CustomDropdown<String>.multiSelect(
        items: items,
        initialItems: [value],
        onListChanged: (p0) {
          //
        },
        decoration: CustomDropdownDecoration(
          // Closed state styling
          closedBorder: Border.all(color: Colors.grey.shade300, width: 1.5),
          closedFillColor: Colors.white,
          closedBorderRadius: BorderRadius.circular(16),

          // Expanded state styling
          expandedBorder: Border.all(color: Colors.blue.shade400, width: 2),
          expandedBorderRadius: BorderRadius.circular(16),

          // Header and hint styling
          headerStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),

          // Dropdown item styling
          listItemStyle: TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),

          // Custom icons and decorations

          // Animation configuration
        ),
      ),
    );
  }
}
