import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FullScreenImageCarousel extends StatefulWidget {
  const FullScreenImageCarousel({
    Key? key,
    required this.imageUrls,
    this.autoPlayDuration = const Duration(seconds: 5),
    this.animationDuration = const Duration(seconds: 1),
  }) : super(key: key);

  final List<String> imageUrls;
  final Duration autoPlayDuration;
  final Duration animationDuration;

  @override
  State<FullScreenImageCarousel> createState() =>
      _FullScreenImageCarouselState();
}

class _FullScreenImageCarouselState extends State<FullScreenImageCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImageCarousel(),
        _buildBackButton(context),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildDotIndicators(),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 40, // Adjust this value to position the button properly
      left: 16,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.clear,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CarouselSlider.builder(
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index, _) {
          return _buildCarouselItem(widget.imageUrls[index]);
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.5,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: widget.autoPlayDuration,
          autoPlayAnimationDuration: widget.animationDuration,
          enableInfiniteScroll: true,
          onPageChanged: (index, _) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: ClipRect(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 32,
              ),
            );
          },
          // loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   return Center(
          //     child: CircularProgressIndicator(
          //       value: loadingProgress.expectedTotalBytes != null
          //           ? loadingProgress.cumulativeBytesLoaded /
          //               loadingProgress.expectedTotalBytes!
          //           : null,
          //     ),
          //   );
          // },
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imageUrls.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () {
              //
            },
            child: Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
