import 'package:event_management_app/models/service_category_data.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/search_result_screen.dart';
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
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              UserSelectCity(),
                              transition: Transition.cupertino,
                              fullscreenDialog: GetPlatform.isAndroid,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width * 0.37,
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
                        InkWell(
                          onTap: () {
                            Get.to(
                              UserSearchScreen(),
                              transition: Transition.cupertino,
                              fullscreenDialog: GetPlatform.isAndroid,
                              duration: const Duration(milliseconds: 600),
                            );
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
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Container(
                // height: MediaQuery.of(context).size.height * .06,
                //width: double.infinity,
                alignment: Alignment.center,
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
          //       //54
          //     },
          //     child: ,
          //   ),
          // ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                _chipLabels.length,
                (index) {
                  if (index == 0) {
                    // "All" tab
                    return _allTabContent();
                  } else {
                    // Other tabs
                    return _otherTabContent();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build content for each tab (category)
  Widget _allTabContent() {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.only(top: 10),
      itemCount: 5, // Example item count, adjust based on data
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.to(
                const UserServiceDetailsScreen(),
                transition: Transition.cupertino,
                fullscreenDialog: GetPlatform.isAndroid,
                duration: const Duration(milliseconds: 600),
              );
            },
            child: const ExploreScreenList(
              icon: IconsaxPlusLinear.heart,
            ),
          ),
        );
      },
    );
  }

  //other tabs
  Widget _otherTabContent() {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      padding: EdgeInsets.only(top: 0),
      itemCount: 1, // Use the number of categories
      itemBuilder: (context, categoryIndex) {
        // Get the current category based on the tab index
        Category currentCategory = categories[_tabController.index - 1];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: currentCategory.subCategories.map((subCategory) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: .0),
              child: InkWell(
                  onTap: () {
                    Get.to(
                      const CategoryServiceViewScreen(),
                      transition: Transition.cupertino,
                      fullscreenDialog: GetPlatform.isAndroid,
                      duration: const Duration(milliseconds: 600),
                    );
                  },
                  child: categoryTiles(
                    imageUrl: subCategory.imageUrl,
                    name: subCategory.name,
                  )),
            );
          }).toList(),
        );
      },
    );
  }
}

// /import 'package:flutter/material.dart';

Widget eventManagerWidget(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.09,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          ColorConstants.primaryForeground,
          ColorConstants.primaryForeground.withOpacity(.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: ColorConstants.primaryForeground.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.event_available,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 12),
        Text(
          "Hire an Event Manager",
          style: TextConstants.subheading.copyWith(
            color: ColorConstants.primaryWhite,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 12),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 20,
        ),
      ],
    ),
  );
}
////

Widget categoryTiles({required imageUrl, required name}) {
  return Card(
    color: ColorConstants.primaryWhite,
    child: ListTile(
      minTileHeight: 65,
      onTap: () {
        Get.to(
          () => CategoryServiceViewScreen(),
          transition: Transition.cupertino,
          fullscreenDialog: GetPlatform.isAndroid,
          duration: const Duration(milliseconds: 600),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        name,
        style: TextConstants.subheading.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorConstants.textPrimary.withOpacity(.7),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey[600],
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  );
}





//event manager


////
// Widget eventManagerWidget(BuildContext context) {
//   return Container(
//     height: MediaQuery.of(context).size.height * .09,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [
//           ColorConstants.primaryForeground.withOpacity(0.8),
//           ColorConstants.primaryForeground.withOpacity(1),
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       border: Border(
//         bottom: BorderSide(
//           color: Colors.blueGrey.shade600,
//         ),
//       ),
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.2),
//           offset: Offset(0, 4),
//           blurRadius: 6,
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.event,
//           color: Colors.white,
//           size: 24,
//         ),
//         SizedBox(width: 8),
//         Text(
//           "Hire an Event Manager",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.8,
//           ),
//         ),
//       ],
//     ),
//   );
// }



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