import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_service_view_screen.dart';
import 'package:flutter/material.dart';

Widget serviceListView2({
  required context,
  required imageUrl,
  required title,
  required description,
  required price,
  required status,
}) {
  final w1 = MediaQuery.of(context).size.width;
  final h1 = MediaQuery.of(context).size.height;
  final h2 = h1 * 0.23;

  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorServiceViewScreen(),
            ));
      },
      child: Container(
        //height: h1 * 0.34,
        width: w1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: h1 * 0.34,
            width: w1,
            decoration: BoxDecoration(
              color: ColorConstants.primaryWhite,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(100, 100, 111, 0.2),
                  blurRadius: 29,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    7,
                  ),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: h1 * 0.25,
                    width: w1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        // BoxShadow(
                        //   blurRadius: .5,
                        //   blurStyle: BlurStyle.outer,
                        //   color: Colors.black12,
                        //   offset: Offset(5, 10),
                        // ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: h2 * .35,
                          width: w1,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Live Music Monata",
                                  style: TextConstants.subheading.copyWith(
                                      fontSize: 22,
                                      color: ColorConstants.primaryWhite,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 5),
                                  child: Text(
                                    "₹ 550",
                                    style: TextConstants.buttonText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //down portion
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorConstants.textSecondary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              color: status == 'Active'
                                  ? ColorConstants.activeColor
                                  : ColorConstants.errorColor,
                              size: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(status,
                                style: TextConstants.buttonText.copyWith(
                                  color: ColorConstants.textPrimary,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConstants.primaryForeground,
                        ),
                        child: Center(
                          child: Text(
                            "See Details",
                            style: TextConstants.buttonText,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
  








// Widget ServiceListView({
//   required context,
//   required imageUrl,
//   required title,
//   required description,
//   required price,
//   required status,
// }) {
//   double screenWidth = MediaQuery.of(context).size.width;

//   // Dynamically set the aspect ratio based on the screen width
//   double aspectRatio = screenWidth > 400 ? 4 / 2 : 4.1 / 2;
//   return AspectRatio(
//     aspectRatio: aspectRatio,
//     child: Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Container(
//         width: double.infinity, // Ensure the width is finite
//         decoration: BoxDecoration(
//           color: ColorConstants.highlightBlueLightest.withOpacity(.5),
//           borderRadius: BorderRadius.circular(8),
//           // border: Border.all(
//           //   color: ColorConstants.textSecondary,

//           // ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   // Calculate a responsive square using MediaQuery
//                   Builder(
//                     builder: (context) {
//                       double width = MediaQuery.of(context).size.width;
//                       double sideLength =
//                           width * 0.2; // 20% of the screen width

//                       // Ensure the square is sized properly
//                       return Container(
//                         width: sideLength,
//                         height: sideLength,
//                         decoration: BoxDecoration(
//                           // color: Colors.grey,
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(
//                               image: NetworkImage(imageUrl), fit: BoxFit.cover),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * .6,
//                         child: Text(
//                           title,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextConstants.headline,
//                         ),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * .6,
//                         child: Text(
//                           description,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextConstants.bodyText,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 // color: Colors.amber,
//                 height: 20, // Height of the dashed line
//                 child: Row(
//                   children: [
//                     Flexible(
//                       child: Text(
//                         '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - ------------------------',
//                         overflow: TextOverflow.fade,
//                         softWrap: true, // Allows the text to wrap
//                         maxLines: 1, // Ensures only one line
//                         style: TextStyle(
//                           color: ColorConstants.textSecondary.withOpacity(.5),
//                           fontSize: 10, // Adjust font size
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "Price",
//                           style: TextConstants.bodyTextSecondary,
//                         ),
//                         Text(
//                           "₹ ${price.toString()}",
//                           style: TextConstants.buttonText
//                               .copyWith(color: ColorConstants.textPrimary),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Status",
//                           style: TextConstants.bodyTextSecondary,
//                         ),
//                         Text(
//                           status,
//                           style: TextConstants.bodyText.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: status == 'Active'
//                                 ? ColorConstants.activeColor
//                                 : ColorConstants.errorColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => VendorServiceViewScreen(),
//                             ));
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: ColorConstants.primaryForeground,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "See Details",
//                             style:
//                                 TextConstants.buttonText.copyWith(fontSize: 14),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
