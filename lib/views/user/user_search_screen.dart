import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';

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
            Text(
              "Browse Categories",
              style: TextConstants.subheading.copyWith(
                fontSize: 23,
              ),
            ),
            SizedBox(height: 5),
            categoryTiles(),
          ],
        ),
      ),
    );
  }
}

Widget categoryTiles() {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2, // Adjust for card aspect ratio
      ),
      itemCount: 12, // Adjust as needed
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage('assets/category_$index.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Category ${index + 1}",
              style: TextStyle(
                fontSize: 16,
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
    ),
  );
}
