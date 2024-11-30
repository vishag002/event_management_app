import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:event_management_app/views/vendor/vendor_inbox_screen.dart';
import 'package:event_management_app/views/vendor/vendor_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
        bottomNavigationBar: bottomBarStyle2(_currentIndex, _onTabTapped));
  }
}

///
Widget bottomBarStyle1(_currentIndex, changeTab) {
  return StylishBottomBar(
    backgroundColor: ColorConstants.lightGreyShade,
    elevation: BorderSide.strokeAlignOutside,
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
        icon: const Icon(Icons.home_filled),
        title: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Text(
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
          child: Text(
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
          child: Text(
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
      changeTab(index);
    },
  );
}

///import 'package:flutter/material.dart';

Widget bottomBarStyle2(int currentIndex, Function(int) changeTab) {
  return SizedBox(
    height: 80,
    width: double.infinity,
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: changeTab,
      enableFeedback: true,
      unselectedLabelStyle: TextConstants.buttonTextSmall.copyWith(
        fontSize: 12,
      ),
      selectedLabelStyle: TextConstants.buttonTextSmall.copyWith(
        fontSize: 12,
      ),
      backgroundColor: ColorConstants.lightGreyShade,
      elevation: 0,
      selectedItemColor: ColorConstants.primaryForeground,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      selectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(IconsaxPlusLinear.home_1),
          ), // Default (unselected) icon
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              IconsaxPlusBold.home_1, // Selected icon
              color: ColorConstants.primaryForeground,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(IconsaxPlusLinear.message_text_1),
          ), // Default (unselected) icon
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              IconsaxPlusBold.message_text_1, // Selected icon
              color: ColorConstants.primaryForeground,
            ),
          ),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(IconsaxPlusLinear.profile_circle),
          ), // Default (unselected) icon
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              IconsaxPlusBold.profile_circle, // Selected icon
              color: ColorConstants.primaryForeground,
            ),
          ),
          label: 'Profile',
        ),
      ],
    ),
  );
}
