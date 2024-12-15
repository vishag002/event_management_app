import 'package:event_management_app/models/service_category_data.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/search_result_screen.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchWidget(),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: TextConstants.subheading.copyWith(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      categoryTiles(subCategories: category.subCategories),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryTiles({required List<SubCategory> subCategories}) {
  return GridView.builder(
    shrinkWrap: true, // Ensures the GridView doesn't occupy infinite height
    physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 3 / 2,
    ),
    itemCount: subCategories.length,
    itemBuilder: (context, index) {
      final subCategory = subCategories[index];
      return InkWell(
        onTap: () {
          Get.to(() => SearchResultScreen());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            // image: DecorationImage(
            //   image: NetworkImage(subCategory.imageUrl),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                subCategory.name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
