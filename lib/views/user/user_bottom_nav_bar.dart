import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_home_screen.dart';
import 'package:event_management_app/views/user/user_inbox_screen.dart';
import 'package:event_management_app/views/user/user_profile_screen.dart';
import 'package:event_management_app/views/user/user_wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  int _currentIndex = 0;
  bool visible = true;

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
            UserHomeScreen(
              hideNavigation: hideNav,
              showNavigation: showNav,
            ),
            UserWishListScreen(),
            UserInboxScreen(),
            UserProfileScreen(),
          ],
        ),
        bottomNavigationBar:
            bottomBarStyle2(_currentIndex, _onTabTapped, context, visible));
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }
}

Widget bottomBarStyle2(
    int currentIndex, Function(int) changeTab, context, visible) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 1000),
    curve: Curves.fastLinearToSlowEaseIn,
    height: visible ? MediaQuery.of(context).size.height * .07 : 0,
    width: double.infinity,
    child: Wrap(
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
                child: Icon(IconsaxPlusLinear.heart),
              ), // Default (unselected) icon
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  IconsaxPlusBold.heart, // Selected icon
                  color: ColorConstants.primaryForeground,
                ),
              ),
              label: 'Wish List',
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
      ],
    ),
  );
}
