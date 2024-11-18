import 'package:event_management_app/views/vendor/widgets/carousel_widget_.dart';
import 'package:flutter/material.dart';

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

    final w1 = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        FullScreenImageCarousel(
          imageUrls: images,
          // Optional: customize durations
          autoPlayDuration: const Duration(seconds: 5),
          animationDuration: const Duration(seconds: 1),
        )
      ],
    ));
  }
}
