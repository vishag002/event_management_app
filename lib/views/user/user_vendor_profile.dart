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
            Text(
              "ABC Limited",
              style: TextConstants.appTitle,
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
                  Icon(Icons.verified, color: Colors.green.shade700, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "Verified Vendor",
                    style: TextConstants.bodyText.copyWith(
                      color: Colors.green.shade700,
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
                  _serviceManagerWidget(),
                  const SizedBox(height: 20),
                  Text(
                    "About",
                    style: TextConstants.headline.copyWith(
                      fontSize: 20,
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
            //  _serviceManagerWidget(),
            //  const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Services Provided",
                    style: TextConstants.headline.copyWith(
                      fontSize: 20,
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

// Widget _buildInfoRow({
//   required IconData icon,
//   required String text,
//   required Color iconColor,
// }) {
//   return Row(
//     children: [
//       Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: iconColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(
//           icon,
//           size: 22,
//           color: iconColor,
//         ),
//       ),
//       const SizedBox(width: 16),
//       Text(text, style: TextConstants.bodyText),
//     ],
//   );
// }

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
                        style: TextConstants.headline.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Marriage | concernt | Birthday",
                        style: TextConstants.smallHighlightText,
                      ),
                      Row(
                        children: [
                          Text(
                            "Starting from ",
                            style: TextConstants.smallHighlightText,
                          ),
                          Text('₹ 550',
                              style: TextConstants.smallHighlightText),
                        ],
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

//service manager widget
Widget _serviceManagerWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Service Manager Availability",
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // const SizedBox(height: 10),

        // Service Manager Availability Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorConstants.primaryWhite,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     blurRadius: 8,
            //     spreadRadius: 2,
            //     offset: const Offset(0, 4),
            //   ),
            // ],
          ),
          child: Row(
            children: [
              // Icon or Image
              // CircleAvatar(
              //   radius: 30,
              //   backgroundColor: Colors.grey[200],
              //   child: Icon(
              //     Icons.person_outline,
              //     size: 30,
              //     color: Colors.grey[400],
              //   ),
              // ),
              // const SizedBox(width: 16),

              // Service Manager Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Manager Available",
                      style: TextConstants.bodyText.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Starting from ₹500",
                      style: TextConstants.errorText.copyWith(
                        color: ColorConstants.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Action Button (Optional)
              InkWell(
                onTap: () {
                  // Perform any action here (e.g., navigate to a details page)
                  Get.to(() => UserServiceDetailsScreen());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryForeground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Connect now",
                    style: TextConstants.buttonText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
