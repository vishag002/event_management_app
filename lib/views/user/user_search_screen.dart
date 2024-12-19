import 'package:event_management_app/models/service_category_data.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/search_result_screen.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchScreen extends StatefulWidget {
  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  // Create a map to track expanded state for each category
  Map<String, bool> _expandedCategories = {};

  @override
  void initState() {
    super.initState();
    // Initialize all categories as collapsed
    for (var category in categories) {
      _expandedCategories[category.name] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        tileColor: ColorConstants.primaryWhite,
                        onTap: () {
                          // Toggle the expanded state for this category
                          setState(() {
                            _expandedCategories[category.name] =
                                !(_expandedCategories[category.name] ?? false);
                          });
                        },
                        title: Text(
                          category.name,
                          style:
                              TextConstants.subheading.copyWith(fontSize: 18),
                        ),
                        trailing: Icon(
                          _expandedCategories[category.name] ?? false
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Conditionally show subcategories based on expanded state
                      if (_expandedCategories[category.name] ?? false)
                        categoryTiles(subCategories: category.subCategories),
                      //  SizedBox(height: 16),
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
    physics: NeverScrollableScrollPhysics(),
    itemCount: subCategories.length,
    itemBuilder: (context, index) {
      final subCategory = subCategories[index];
      return Card(
        color: ColorConstants.primaryWhite,
        child: ListTile(
          onTap: () {
            Get.to(
              () => CategoryServiceViewScreen(),
              transition: Transition.cupertino,
              fullscreenDialog: GetPlatform.isAndroid,
              duration: const Duration(milliseconds: 600),
            );
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
            style: TextConstants.subheading.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.textPrimary.withOpacity(.7),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[600],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      );
    },
  );
}
