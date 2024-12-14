import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            Get.to(const UserServiceDetailsScreen());
          },
          child: const ExploreScreenList(
            icon: IconsaxPlusLinear.heart,
          ),
        ),
      );
    },
  );
}
