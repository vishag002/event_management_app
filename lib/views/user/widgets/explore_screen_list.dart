import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreenList extends StatelessWidget {
  const ExploreScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;

    return Container(
      //height: h1 * 0.5,
      width: w1,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h1 * 0.3,
                width: w1,
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                    top: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.heart_circle,
                    size: w1 * 0.1, // Responsive icon size
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                ),
              ),
            ],
          ),
          SizedBox(
              height: h1 * 0.02), // Space between the amber container and text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w1 * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title of the Section',
                  style: TextStyle(
                    fontSize: w1 * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h1 * 0.01),
                Text(
                  'This is a description that provides more details about this section. ',
                  style: TextStyle(
                    fontSize: w1 * 0.04, // Responsive font size
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
