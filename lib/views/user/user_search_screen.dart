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
  return ListView.builder(
    shrinkWrap: true,
    physics:
        NeverScrollableScrollPhysics(), // Prevents scrolling within the parent scroll view
    itemCount: subCategories.length,
    itemBuilder: (context, index) {
      final subCategory = subCategories[index];
      return ListTile(
        onTap: () {
          Get.to(() => SearchResultScreen());
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            subCategory.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          subCategory.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[600],
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      );
    },
  );
}
