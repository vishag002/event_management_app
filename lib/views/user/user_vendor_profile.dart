import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class UserVendorProfile extends StatelessWidget {
  const UserVendorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vendor Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: MediaQuery.of(context).size.height * .06,
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.height * .06,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Vendor Name
            const Text(
              "ABC Limited",
              style: TextStyle(
                fontSize: 24,
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
            Container(
              height: 80,
              width: double.infinity,
              //color: Colors.green.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryForeground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        IconsaxPlusBold.call,
                        color: ColorConstants.primaryWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryForeground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.mail_solid,
                        color: ColorConstants.primaryWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryForeground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        IconsaxPlusBold.location,
                        color: ColorConstants.primaryWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique.',
                    style: TextConstants.bodyText,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Services Provided",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Service List
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // Navigate to service details page
                        },
                        child: serviceListView(
                          context: context,
                          imageUrl:
                              "https://res.cloudinary.com/dreamworth-in/image/upload/v1502875248/event-planning.jpg",
                          title: "Service ${index + 1}",
                          description:
                              "Brief description of the service provided.",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInfoRow({
  required IconData icon,
  required String text,
  required Color iconColor,
}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
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

Widget serviceListView({
  required context,
  required imageUrl,
  required title,
  required description,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: InkWell(
      onTap: () {
        Get.to(UserServiceDetailsScreen());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
            color: ColorConstants.primaryWhite,
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(30)
            // boxShadow: [
            //   BoxShadow(
            //     color: Color.fromRGBO(100, 100, 111, 0.2),
            //     blurRadius: 29,
            //     spreadRadius: 0,
            //     offset: Offset(
            //       0,
            //       7,
            //     ),
            //   ),
            // ],
            ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 150, // Adjust height as needed
                decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.visionvivaah.com/blog/wp-content/uploads/2019/10/Best-Event-Management-Company-In-Mumbai.jpg'), // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service name",
                        style: TextConstants.formLabel.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec sodales dui, at maximus neque. Nullam vitae blandit ex. Morbi placerat augue vitae libero vehicula eleifend. Ut et pretium urna, eu viverra massa. Maecenas vitae vulputate turpis. Ut non nisl nec dui vehicula pharetra a id mi. Aliquam feugiat fringilla suscipit. Aliquam accumsan cursus blandit. Nullam bibendum vel libero id consequat. Duis ultricies fringilla turpis, nec dignissim erat cursus aliquam",
                        style: TextConstants.bodyText.copyWith(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
