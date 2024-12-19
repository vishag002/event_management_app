import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_vendor_profile.dart';
import 'package:event_management_app/views/user/widgets/user_carousel_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserServiceDetailsScreen extends StatelessWidget {
  const UserServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://lh5.googleusercontent.com/proxy/U47y8_8HB4T3IGrTq8aLyb7mvbHtMoRG5fgKPx1OnadMmRBGrSUbtLhKQXUE3RondLGoaq13Zn5cFIjWXyDaykiaJe_QbDFpfbEE2hz_itTaOS7alvigY8-WZA',
      'https://sousys.co.in/wp-content/uploads/2024/02/dj-service-1000x1000-1.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRstgDu88i4tfrnMfGsqUCEbqrC49Ye5HRp2g&s',
      'https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg',
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(bottom: 0), // Ensure spacing for BottomAppBar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserCarouselViewWidget(imageUrls: images),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Service Name",
                style: TextConstants.subheading.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(UserVendorProfile());
              },
              child: vendorNameTab(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Category",
                style: TextConstants.formLabel.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Birthday | Private Event",
                style: TextConstants.bodyText.copyWith(),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Description",
                style: TextConstants.formLabel.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextConstants.formLabel
                    .copyWith(color: ColorConstants.textSecondary),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        surfaceTintColor: Colors.amber,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        //color: Colors.red,
        padding: EdgeInsets.all(0),
        child: userActionWidget(context: context),
      ),
    );
  }
}

////
Widget vendorNameTab() {
  return Container(
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      //color: Colors.amber,
      border: Border.symmetric(
        horizontal:
            BorderSide(color: ColorConstants.greySecondary.withOpacity(.1)),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorConstants.primaryWhite,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT66aK8NXijjNwmBSeF3mRWPhwN-9uBemCVWA&s"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "ABC Limited",
                  style: TextConstants.formLabel.copyWith(
                    height: 1,
                    //fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ), // Add height: 1
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "5 Services",
                    style: TextConstants.smallHighlightText,
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

//Service Action Button
Widget userActionWidget({context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConstants.primaryForeground,
        border: Border.all(color: ColorConstants.primaryForeground),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pricing Starts At",
                  style: TextConstants.smallHighlightText.copyWith(
                      color: ColorConstants.primaryWhite.withOpacity(.7),
                      height: 0,
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  "₹ 550",
                  style: TextConstants.subheading.copyWith(
                      color: ColorConstants.primaryWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstants.primaryWhite,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.message,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Connect",
                          style: TextConstants.buttonText2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
