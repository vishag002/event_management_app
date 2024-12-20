import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class UserWishListScreen extends StatelessWidget {
  const UserWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Wishlist"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.to(const UserServiceDetailsScreen());
            },
            child: const ExploreScreenList(
              icon: IconsaxPlusBold.heart,
            ),
          ),
        ),
      ),
    );
  }
}
