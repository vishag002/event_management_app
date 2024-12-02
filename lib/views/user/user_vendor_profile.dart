import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserVendorProfile extends StatelessWidget {
  const UserVendorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image
            Container(
              // margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: MediaQuery.of(context).size.height * .06,
                // backgroundImage: NetworkImage(
                //   "https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg",
                // ),
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.height * .06,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Vendor Name
            const Text(
              "ABC Limited",
              style: TextStyle(
                fontSize: 28,
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

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique  ',
                style: TextConstants.bodyText,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),

            // Contact Information Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow(
                    icon: CupertinoIcons.phone_circle_fill,
                    text: "12345689",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.location_on,
                    text: "ABC Road, Bangalore",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.email_outlined,
                    text: "demo@demo.com",
                    iconColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Grid View with Constrained Height
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => ServiceListView(
                context: context,
                imageUrl:
                    "https://res.cloudinary.com/dreamworth-in/image/upload/v1502875248/event-planning.jpg",
                title: "title",
                description: "description",
              ),
            )
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
        padding: const EdgeInsets.all(8),
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

///

Widget ServiceListView({
  required context,
  required imageUrl,
  required title,
  required description,
}) {
  double W1 = MediaQuery.of(context).size.width;

  // Dynamically set the aspect ratio based on the screen width
  //double aspectRatio = screenWidth > 400 ? 4 / 2 : 4.1 / 2;
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      width: double.infinity, // Ensure the width is finite
      decoration: BoxDecoration(
        color: ColorConstants.highlightBlueLightest.withOpacity(.5),
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(
        //   color: ColorConstants.textSecondary,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // Calculate a responsive square using MediaQuery
                Builder(
                  builder: (context) {
                    double width = MediaQuery.of(context).size.width;
                    double sideLength = width * 0.2; // 20% of the screen width

                    // Ensure the square is sized properly
                    return Container(
                      width: sideLength,
                      height: sideLength,
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextConstants.formLabel,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextConstants.bodyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
