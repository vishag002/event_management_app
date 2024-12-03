// import 'package:event_management_app/utilis/color_const.dart';
// import 'package:event_management_app/utilis/text_const.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';

// class CategoryDropDown extends StatefulWidget {
//   const CategoryDropDown({super.key});

//   @override
//   State<CategoryDropDown> createState() => _CategoryDropDownState();
// }

// class _CategoryDropDownState extends State<CategoryDropDown> {
//   final _formKey = GlobalKey<FormState>();

//   final controller = MultiSelectController<String>();

//   @override
//   Widget build(BuildContext context) {
//     var categoryList = [
//       DropdownItem(label: 'Wedding', value: 'Wedding'),
//       DropdownItem(label: 'Corporate', value: 'Corporate'),
//       DropdownItem(label: 'Private Show', value: 'Private Show'),
//       DropdownItem(label: 'Concert', value: 'Concert'),
//     ];

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: SizedBox(
//         width: double.infinity,
//         //height: 65,
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 4),
//               MultiDropdown<String>(
//                 items: categoryList,
//                 controller: controller,
//                 enabled: true,
//                 searchEnabled: false,

//                 //selected chip widget
//                 chipDecoration: ChipDecoration(
//                   labelStyle: TextConstants.formLabel,
//                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                   backgroundColor: ColorConstants.highlightBlue,
//                   wrap: true,
//                   runSpacing: 2,
//                   spacing: 10,
//                 ),

//                 //
//                 autovalidateMode: AutovalidateMode.disabled,
//                 fieldDecoration: FieldDecoration(
//                   backgroundColor: Colors.white,
//                   animateSuffixIcon: true,
//                   suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
//                   borderRadius: 8,
//                   labelText: "Select your fields ",
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   hintText: 'Select Category',
//                   hintStyle: const TextStyle(color: Colors.black87),
//                   showClearIcon: false,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Colors.transparent),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                         color: ColorConstants.primaryForeground),
//                   ),
//                 ),
//                 //
//                 dropdownDecoration: const DropdownDecoration(
//                   backgroundColor: ColorConstants.backgroundPrimary,
//                   elevation: 0,
//                   maxHeight: 400,
//                   header: Padding(
//                     padding: EdgeInsets.all(0),
//                   ),
//                 ),
//                 dropdownItemDecoration: const DropdownItemDecoration(
//                   textColor: Colors.black,
//                   selectedBackgroundColor: Colors.white,
//                   backgroundColor: ColorConstants.backgroundPrimary,
//                   disabledBackgroundColor: ColorConstants.activeColor,
//                   selectedIcon: Icon(
//                     IconsaxPlusBold.tick_square,
//                     color: ColorConstants.primaryForeground,
//                   ),
//                 ),
//                 closeOnBackButton: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a category';
//                   }
//                   return null;
//                 },
//                 onSelectionChange: (selectedItems) {
//                   debugPrint("Selected Categories: $selectedItems");
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////try this one
import 'package:flutter/material.dart';

class SearchfField extends StatelessWidget {
  const SearchfField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
        child: const TextField(
          maxLines: 2,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintText: 'Where to? \nAnywhere • Any week • Add guests',
            hintMaxLines: 2,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
