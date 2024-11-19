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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FullScreenImageCarousel(
            imageUrls: images,
            // Optional: customize durations
            autoPlayDuration: const Duration(seconds: 5),
            animationDuration: const Duration(seconds: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DJ Service',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                // Description
                const SizedBox(height: 10),
                const Text(
                  'Professional DJ services for weddings, parties, and corporate events. High-quality sound equipment and experienced DJs to make your event memorable.',
                  style: TextStyle(color: Colors.grey),
                ),

                // Price
                const SizedBox(height: 10),
                const Text(
                  '\$550/Day',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(5),
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
                    // Delete action
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
    );
  }
}
