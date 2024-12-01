import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  // List of chip labels
  final List<String> _chipLabels = [
    "all",
    "Marrage",
    "Stage Decoration",
    "Private shows"
  ];

  // Track the currently selected chip
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Name",
          style: TextConstants.appTitle,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            // width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_chipLabels.length, (index) {
                  return SingleChildScrollView(
                    child: _chipContainer(
                      label: _chipLabels[index],
                      isSelected: _selectedChipIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedChipIndex = index;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchWidget(),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Get.to(UserServiceDetailsScreen());
                    },
                    child: ExploreScreenList()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Updated chip container widget with selection and tap functionality
  Widget _chipContainer(
      {required String label, bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.primaryForeground
                : ColorConstants.highlightBlueLightest,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black, // Text color changes with selection
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Your existing search widget (assuming it's defined elsewhere)
}
