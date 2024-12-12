import 'package:event_management_app/Authentication/login_new.dart';
import 'package:event_management_app/Authentication/vendorss/vendor_loogin.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/views/user/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryWhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryWhite,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageContainer(context),
          const SizedBox(height: 20),
          _centerText(),
          const SizedBox(height: 30),
          _roleSelectionWidget(context),
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Wedding planner.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _centerText() {
    return const Column(
      children: [
        Text(
          "Event Management App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Select Your Role",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _roleSelectionWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _roleOption(
          context,
          label: "Guest",
          icon: Icons.person_outline,
          onTap: () {
            Get.offAll(
              () => const UserBottomNavBar(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        _roleOption(
          context,
          label: "User",
          icon: Icons.person,
          onTap: () {
            Get.offAll(
              () => const LoginPage(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        _roleOption(
          context,
          label: "Vendor",
          icon: Icons.storefront_outlined,
          onTap: () {
            Get.offAll(
              const VendorLoginScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
      ],
    );
  }

  Widget _roleOption(BuildContext context,
      {required String label,
      required IconData icon,
      required VoidCallback onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.primaryForeground.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: ColorConstants.primaryForeground,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
