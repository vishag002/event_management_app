import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';

class ExploreScreenList extends StatelessWidget {
  const ExploreScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        //height: h1 * 0.5,
        width: w1,
        decoration: BoxDecoration(
          color: ColorConstants.primaryWhite,
          borderRadius: BorderRadius.circular(30),
        ),
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
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://sousys.co.in/wp-content/uploads/2024/02/dj-service-1000x1000-1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.greySecondary.withOpacity(.3),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          // TODO: FAVORITE BUTTON
                        },
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: ColorConstants.errorColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      "Stage Decorations",
                      style: TextConstants.headline,
                    ),
                    const SizedBox(height: 3),

                    //
                    Text(
                      "Marriage | concernt | Birthday",
                      style: TextConstants.smallHighlightText,
                    ),

                    const SizedBox(height: 3),

                    Row(
                      children: [
                        Text(
                          "Starting from ",
                          style: TextConstants.smallHighlightText,
                        ),
                        Text('₹ 550', style: TextConstants.smallHighlightText),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
