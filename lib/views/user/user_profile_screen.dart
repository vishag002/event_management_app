import 'package:event_management_app/Authentication/role_selection_screen.dart';
import 'package:event_management_app/views/user/user_edit_profile_screen.dart';
import 'package:event_management_app/views/user/user_faq_screen.dart';
import 'package:event_management_app/views/user/user_security_screen.dart';
import 'package:flutter/material.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildUserHeader(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _buildProfileSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/premium-vector/character-avatar-isolated_729149-194801.jpg?semt=ais_hybrid',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "John Doe",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "john.doe@gmail.com",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      children: [
        _buildProfileMenuItem(
          icon: Icons.edit,
          title: "Edit Profile",
          onTap: () {
            Get.to(
              () => UserEditProfileScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.lock,
          title: "Security",
          onTap: () {
            Get.to(
              () => UserSecurityScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.support_agent,
          title: "Customer Support",
          onTap: () {
            // Navigate to customer support
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.help_outline,
          title: "FAQ",
          onTap: () {
            Get.to(
              () => UserFaqScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.share,
          title: "Share App",
          onTap: () async {
            try {
              await Share.share(
                'Check out this app: https://play.google.com/store/apps/details?id=com.example.myapp',
                subject: 'Flutter App Recommendation',
              );
            } catch (e) {
              debugPrint('Error sharing content: $e');
            }
          },
        ),
        const Divider(),
        _buildProfileMenuItem(
          icon: Icons.logout,
          title: "Logout",
          onTap: () {
            navigationAction();
          },
          isLogout: true,
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : null,
      ),
      title: Text(
        title,
        style: isLogout
            ? TextConstants.subheading.copyWith(color: Colors.red)
            : TextConstants.subheading,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void navigationAction() {
    Get.offAll(
      const RoleSelectionScreen(),
      transition: Transition.cupertino,
      fullscreenDialog: GetPlatform.isAndroid,
      duration: const Duration(milliseconds: 600),
    ); // Proper GetX navigation with lazy initialization
  }
}
