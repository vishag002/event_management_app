import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_search_screen.dart';
import 'package:event_management_app/views/user/user_select_city.dart';
import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class UserHomeScreen extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;
  const UserHomeScreen(
      {super.key, required this.showNavigation, required this.hideNavigation});

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController scrollController = ScrollController();

  final List<String> _chipLabels = [
    "All",
    "Weddings",
    "Corporate",
    "Private show",
    "Concert",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _chipLabels.length, vsync: this);

    //scroll controller
    scrollController.addListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          widget.showNavigation();
        } else {
          widget.hideNavigation();
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.removeListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          widget.showNavigation();
        } else {
          widget.hideNavigation();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 90,
        toolbarHeight: MediaQuery.of(context).size.height * 0.164,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         //
        //       },
        //       icon: Icon(Icons.search))
        // ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Title(
                color: ColorConstants.textPrimary,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(UserSearchScreen());
                          },
                          child: Container(
                            //width: 40,
                            //height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  ColorConstants.greySecondary.withOpacity(.1),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.search,
                                  size: 32,
                                  color: ColorConstants.primaryForeground,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Get.to(UserSelectCity());
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width * 0.35,
                            //height: MediaQuery.of(context).size.height * .05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:
                                  ColorConstants.greySecondary.withOpacity(.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(CupertinoIcons.location_solid),
                                  SizedBox(width: 10),
                                  Text(
                                    "Banglore",
                                    style: TextConstants.buttonText2.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Container(
                // height: MediaQuery.of(context).size.height * .06,
                // width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    eventManagerWidget(context),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelStyle: TextConstants.headline.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextConstants.headline.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
            insets: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: List.generate(_chipLabels.length, (index) {
            return Tab(
              text: _chipLabels[index],
            );
          }),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       //
          //     },
          //     child: ,
          //   ),
          // ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(_chipLabels.length, (index) {
                return _buildCategoryContent();
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Build content for each tab (category)
  Widget _buildCategoryContent() {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.only(top: 10),
      itemCount: 5, // Example item count, adjust based on data
      itemBuilder: (context, idx) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.to(const UserServiceDetailsScreen());
            },
            child: const ExploreScreenList(
              icon: IconsaxPlusLinear.heart,
            ),
          ),
        );
      },
    );
  }
}

//event manager
Widget eventManagerWidget(context) {
  return Container(
    height: MediaQuery.of(context).size.height * .09,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          bottom: BorderSide(
            color: ColorConstants.primaryForeground,
          ),
        ),
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hire an event manager",
          style: TextConstants.buttonText2,
        ),
        // IconButton(
        //     onPressed: () {
        //       //
        //     },
        //     icon: const Icon(Icons.close))
      ],
    ),
  );
}


//search widget

// Widget searchWidget({context}) {
//   return Container(
//     height: MediaQuery.of(context).size.height * .06,
//     width: double.infinity,
//     decoration: BoxDecoration(
//         color: ColorConstants.lightGreyShade,
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(
//           color: ColorConstants.textSecondary.withOpacity(.5),
//           width: 1,
//         )),
//     child: Center(
//       child: TextField(
//         textAlignVertical:
//             TextAlignVertical.center, // Center the text vertically
//         textAlign: TextAlign.start, // Align text to the start horizontally
//         decoration: InputDecoration(
//           border: InputBorder.none, // Remove the border
//           hintText: "Search your services",
//           hintStyle: TextConstants.bodyTextSecondary,
//           prefixIcon: const Icon(
//             CupertinoIcons.search,
//             color: ColorConstants.textSecondary, // Add appropriate color
//           ),
//           contentPadding: EdgeInsets.zero, // Adjust padding to center hint
//         ),
//         style: TextConstants.bodyText, // Style for the input text
//         cursorColor: ColorConstants.textSecondary,
//       ),
//     ),
//   );
// }



//first chip style

// Widget _chipContainer(
//     {required String label, bool isSelected = false, VoidCallback? onTap}) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected
//               ? ColorConstants.primaryForeground
//               : ColorConstants.highlightBlueLightest,
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Text(
//             label,
//             style: TextStyle(
//               color: isSelected
//                   ? Colors.white
//                   : Colors.black, // Text color changes with selection
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
