import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:event_management_app/views/vendor/vendor_inbox_screen.dart';
import 'package:event_management_app/views/vendor/vendor_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            borderRadius: BorderRadius.circular(30),
            unselectedIconColor: Colors.black,
            padding: EdgeInsets.only(left: 0, bottom: 0)),
        // option: AnimatedBarOptions(
        //   iconSize: 32,
        //   barAnimation: BarAnimation.blink,
        //   iconStyle: IconStyle.animated,
        //   opacity: 0.3,
        // ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextConstants.buttonText2,
            ),
            backgroundColor: ColorConstants.primaryForegroundLight,
            selectedIcon: const Icon(
              Icons.home_filled,
              color: ColorConstants.primaryForeground,
            ),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.black,
            ),
            title: const Text(
              'message',
              style: TextConstants.buttonText2,
            ),
            backgroundColor: ColorConstants.primaryForegroundLight,
            selectedIcon: const Icon(
              Icons.message,
              color: ColorConstants.primaryForeground,
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_2_outlined),
            title: const Text(
              'Profile',
              style: TextConstants.buttonText2,
            ),
            backgroundColor: ColorConstants.highlightBlue,
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
          setState(
            () {
              _currentIndex = index;
              //  controller.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
