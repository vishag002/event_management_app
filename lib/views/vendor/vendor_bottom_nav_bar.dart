import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:event_management_app/views/vendor/vendor_inbox_screen.dart';
import 'package:event_management_app/views/vendor/vendor_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class VendorBottomNavBar extends StatefulWidget {
  const VendorBottomNavBar({super.key});

  @override
  State<VendorBottomNavBar> createState() => _VendorBottomNavBarState();
}

class _VendorBottomNavBarState extends State<VendorBottomNavBar> {
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          VendorHomeScreen(),
          VendorInboxScreen(),
          VendorProfileScreen(),
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        iconSpace: 1.0, // Adjust spacing between icons
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          borderRadius: BorderRadius.circular(30), // Adjust for compact bubbles
          unselectedIconColor: Colors.grey,
          padding: const EdgeInsets.only(
              bottom: 5, left: 5, right: 30, top: 15), // Reduce bubble padding
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              HugeIcons.strokeRoundedHome07,
              fill: 1,
              weight: 60,
              size: 40,
              color: Colors.amber,
            ),
            title: const Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: const Text(
                'Home',
                style: TextConstants.buttonText2, // Consistent font adjustment
              ),
            ),
            backgroundColor: ColorConstants.primaryForegroundLight,
            selectedIcon: const Icon(
              Icons.home_filled,
              color: ColorConstants.primaryForeground,
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.message_outlined),
            title: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: const Text(
                'Inbox',
                style: TextConstants.buttonText2, // Consistent font adjustment
              ),
            ),
            backgroundColor: ColorConstants.primaryForegroundLight,
            selectedIcon: const Icon(
              Icons.message,
              color: ColorConstants.primaryForeground,
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_2_outlined),
            title: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: const Text(
                'Profile',
                style: TextConstants.buttonText2, // Consistent font adjustment
              ),
            ),
            backgroundColor: ColorConstants.primaryForegroundLight,
            selectedIcon: const Icon(
              Icons.person_2,
              color: ColorConstants.primaryForeground,
            ),
          ),
        ],
        hasNotch: false,
        notchStyle: NotchStyle.square,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
