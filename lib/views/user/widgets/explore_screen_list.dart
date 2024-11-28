import 'package:flutter/material.dart';

class ExploreScreenList extends StatelessWidget {
  const ExploreScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;
    return Container(
      height: h1 * 0.5,
      width: w1,
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        children: [
          Container(
            height: h1 * 0.34,
            width: w1,
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
                top: Radius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
