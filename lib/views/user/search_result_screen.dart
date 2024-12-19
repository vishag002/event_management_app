import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CategoryServiceViewScreen extends StatelessWidget {
  const CategoryServiceViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: _buildCategoryContent(),
    );
  }
}

Widget _buildCategoryContent() {
  return ListView.builder(
    shrinkWrap: true,
    padding: EdgeInsets.only(top: 10),
    itemCount: 5,
    itemBuilder: (context, idx) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Get.to(
              const UserServiceDetailsScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
          },
          child: const ExploreScreenList(
            icon: IconsaxPlusLinear.heart,
          ),
        ),
      );
    },
  );
}
