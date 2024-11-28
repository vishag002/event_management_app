import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:event_management_app/views/vendor/widgets/carousel_widget_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'widgets/delete_pop_up_widget.dart';

class VendorServiceViewScreen extends StatelessWidget {
  const VendorServiceViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://lh5.googleusercontent.com/proxy/U47y8_8HB4T3IGrTq8aLyb7mvbHtMoRG5fgKPx1OnadMmRBGrSUbtLhKQXUE3RondLGoaq13Zn5cFIjWXyDaykiaJe_QbDFpfbEE2hz_itTaOS7alvigY8-WZA',
      'https://sousys.co.in/wp-content/uploads/2024/02/dj-service-1000x1000-1.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRstgDu88i4tfrnMfGsqUCEbqrC49Ye5HRp2g&s',
      'https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          "Service Detail",
          style: TextConstants.headline.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8, top: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FullScreenImageCarousel(
                imageUrls: images,
                autoPlayDuration: const Duration(seconds: 5),
                animationDuration: const Duration(milliseconds: 750),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 65,
                      width: double.infinity,
                      // color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DJ Service',
                            style: TextConstants.appTitle.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('₹ 550', style: TextConstants.appTitle),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(' /Day',
                                    style: TextConstants.appTitle
                                        .copyWith(fontSize: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 10),
                    //category

                    Text(
                      "Wedding | Birthday | Private show",
                      style: TextConstants.bodyTextSecondary,
                    ),
                    // Description
                    SizedBox(height: 30),
                    Text(
                      "Description",
                      style: TextConstants.formLabel.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextConstants.formLabel
                          .copyWith(color: ColorConstants.textSecondary),
                    ),

                    // Price
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    //
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: ColorConstants.primaryForeground,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_outlined),
                          Text(
                            ' Edit',
                            style: TextConstants.buttonText.copyWith(
                                color: ColorConstants.primaryForeground),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => BlurryDialog(
                        title: "Are you sure?",
                        description:
                            "Are you sure you want to delete this service. This action cannot be undone",
                        onContinue: () {
                          Navigator.pop(context);
                          Get.offAll(
                            const VendorBottomNavBar(),
                            transition: Transition.cupertino,
                            fullscreenDialog: GetPlatform.isAndroid,
                            duration: const Duration(milliseconds: 600),
                          );

                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //       builder: (context) => VendorBottomNavBar(),
                          //     ),
                          //     (route) => false);
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorConstants.primaryForeground,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: ColorConstants.primaryWhite,
                          ),
                          Text(
                            ' Delete',
                            style: TextConstants.buttonText,
                          )
                        ],
                      ),
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
}
