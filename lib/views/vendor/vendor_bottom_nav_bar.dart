import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:event_management_app/views/vendor/vendor_inbox_screen.dart';
import 'package:event_management_app/views/vendor/vendor_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConstants.primaryForeground,
          unselectedItemColor: Colors.grey,
          backgroundColor: ColorConstants.backgroundPrimary,
          currentIndex: _currentIndex, // Set the current tab index
          onTap: _onTabTapped, // Handle tab selection
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                fill: .5,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_crop_circle,
                size: 30,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
