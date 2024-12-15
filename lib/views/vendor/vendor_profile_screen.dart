import 'package:event_management_app/Authentication/role_selection_screen.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              color: ColorConstants.backgroundPrimary,
              itemBuilder: (BuildContext context) {
                return [
                  _buildPopupMenuItem(
                      "Edit Profile", Icons.edit, context, navigationAction),
                  _buildPopupMenuItem(
                      "LogOut", Icons.logout, context, navigationAction),
                ];
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image
            Container(
              // margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: MediaQuery.of(context).size.height * .06,
                // backgroundImage: NetworkImage(
                //   "https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg",
                // ),
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.height * .06,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Vendor Name
            const Text(
              "ABC Limited",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Verification Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle,
                      color: Colors.green.shade700, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "Verified Vendor",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique  ',
                style: TextConstants.bodyText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Contact Information Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow(
                    icon: CupertinoIcons.phone_circle_fill,
                    text: "12345689",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.location_on,
                    text: "ABC Road, Bangalore",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.email_outlined,
                    text: "demo@demo.com",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Grid View with Constrained Height
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    // child: Text(
                    //   'Item $index',
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 22,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 16),
        Text(text, style: TextConstants.bodyText),
      ],
    );
  }

  /////
  ///

  PopupMenuItem _buildPopupMenuItem(String menuTitle, IconData iconData,
      BuildContext context, button_action) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust padding or icon size based on screen size
    double iconSize =
        screenWidth < 400 ? 20.0 : 24.0; // Smaller icons for small screens
    double fontSize =
        screenWidth < 400 ? 14.0 : 16.0; // Smaller text for small screens

    return PopupMenuItem(
      onTap: () {
        button_action();
      },
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Minimal padding
      height: 40.0, // Fixed height for consistent look
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: iconSize,
          ),
          SizedBox(width: 12.0), // Space between icon and text
          Text(
            menuTitle,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.w400, // Lighter text for a minimal look
            ),
          ),
        ],
      ),
    );
  }

  void popAction(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Safely pops the current route if possible
    }
  }

  void navigationAction() {
    Get.offAll(
      const RoleSelectionScreen(),
      transition: Transition.cupertino,
      fullscreenDialog: GetPlatform.isAndroid,
      duration: const Duration(milliseconds: 600),
    );
  }
}

///
