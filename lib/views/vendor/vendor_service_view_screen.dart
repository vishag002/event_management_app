import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_bottom_nav_bar.dart';
import 'package:event_management_app/views/vendor/widgets/carousel_widget_.dart';
import 'package:flutter/material.dart';

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

    return SafeArea(
      child: Scaffold(
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
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DJ Service',
                        style: TextConstants.appTitle,
                      ),
                      // Description
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextConstants.bodyText,
                      ),

                      // Price
                      SizedBox(height: 10),
                      Text('₹ 550/Day', style: TextConstants.appTitle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 70,
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
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Edit action
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => BlurryDialog(
                          title: "Are you sure you want to Delete?",
                          description: "This action cannot be undone.",
                          onContinue: () {
                            // Navigate to Vendor Home Screen or perform any action
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VendorBottomNavBar()),
                            );
                          },
                          onCancel: () {
                            // Optional cancel behavior
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
