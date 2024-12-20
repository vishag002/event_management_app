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
              color: ColorConstants.lightGreyShade,
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
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Live Music Monata",
                                  style: TextConstants.subheading.copyWith(
                                      fontSize: 22,
                                      color: ColorConstants.lightGreyShade,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 5),
                                    child: Text(
                                      "₹ 550",
                                      style: TextConstants.buttonText,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                Flexible(
                  child: Padding(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 9),
                          decoration: BoxDecoration(
                            color: ColorConstants.primaryForeground,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "See Details",
                                style: TextConstants.buttonText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

////