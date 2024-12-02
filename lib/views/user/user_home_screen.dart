import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/user_service_details_screen.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _chipLabels = [
    "All",
    "Corporate",
    "Private shows",
    "Concert",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _chipLabels.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Title(
                color: ColorConstants.textPrimary,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "App Name",
                    style: TextConstants.appTitle
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    searchWidget(),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelStyle: TextConstants.headline.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextConstants.headline.copyWith(
            fontSize: 15,
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
      body: TabBarView(
        controller: _tabController,
        children: List.generate(_chipLabels.length, (index) {
          return _buildCategoryContent(index);
        }),
      ),
    );
  }

  // Build content for each tab (category)
  Widget _buildCategoryContent(int index) {
    return ListView.builder(
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
              icon: Icons.favorite_border,
            ),
          ),
        );
      },
    );
  }
}



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
