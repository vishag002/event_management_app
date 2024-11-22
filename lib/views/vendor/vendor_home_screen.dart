import 'package:event_management_app/models/service_model.dart';
import 'package:event_management_app/models/services_demo_list.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_add_service_screen.dart';
import 'package:event_management_app/views/vendor/vendor_service_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<ServiceModel> serviceItems = getServiceItems();

  @override
  void initState() {
    super.initState();
    // Initialize TabController
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter the service items based on the selected filter
  List<ServiceModel> getFilteredItems(String filter) {
    if (filter == 'All') {
      return serviceItems;
    }
    return serviceItems.where((service) => service.status == filter).toList();
  }

  List<String> tabLabels = ['All', 'Active', 'Pending'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabLabels.map((String label) => Tab(text: label)).toList(),
          labelColor: ColorConstants.primaryForeground,
          labelStyle: TextConstants.bodyText,
          unselectedLabelColor: Colors.grey,
          indicatorColor: ColorConstants.cardBackground,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildServiceList(getFilteredItems('All')),
          _buildServiceList(getFilteredItems('Active')),
          _buildServiceList(getFilteredItems('Pending')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.primaryForeground,
        foregroundColor: ColorConstants.backgroundPrimary,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorAddServiceScreen(),
            ),
          );
        },
        child: Icon(
          CupertinoIcons.add,
          size: 35,
        ),
      ),
    );
  }

  Widget _buildServiceList(List<ServiceModel> filteredItems) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "My Services",
              style: TextConstants.appTitle,
            ),
          ),
          const SizedBox(height: 20),
          searchWidget(),
          const SizedBox(height: 15),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      "No services found",
                      style: TextConstants.bodyText,
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = filteredItems[index];
                      return ServiceListView(
                        context: context,
                        description: item.description,
                        imageUrl: item.imageUrl,
                        price: item.price,
                        status: item.status,
                        title: item.title,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

Widget ServiceListView({
  required context,
  required imageUrl,
  required title,
  required description,
  required price,
  required status,
}) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Dynamically set the aspect ratio based on the screen width
  double aspectRatio = screenWidth > 400 ? 4 / 2 : 4.1 / 2;
  return AspectRatio(
    aspectRatio: aspectRatio,
    child: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity, // Ensure the width is finite
        decoration: BoxDecoration(
          color: ColorConstants.highlightBlueLightest.withOpacity(.5),
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(
          //   color: ColorConstants.textSecondary,

          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Calculate a responsive square using MediaQuery
                  Builder(
                    builder: (context) {
                      double width = MediaQuery.of(context).size.width;
                      double sideLength =
                          width * 0.2; // 20% of the screen width

                      // Ensure the square is sized properly
                      return Container(
                        width: sideLength,
                        height: sideLength,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextConstants.headline,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextConstants.bodyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                // color: Colors.amber,
                height: 20, // Height of the dashed line
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - ------------------------',
                        overflow: TextOverflow.fade,
                        softWrap: true, // Allows the text to wrap
                        maxLines: 1, // Ensures only one line
                        style: TextStyle(
                          color: ColorConstants.textSecondary.withOpacity(.5),
                          fontSize: 10, // Adjust font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextConstants.bodyTextSecondary,
                        ),
                        Text(
                          "₹ ${price.toString()}",
                          style: TextConstants.buttonText
                              .copyWith(color: ColorConstants.textPrimary),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Status",
                          style: TextConstants.bodyTextSecondary,
                        ),
                        Text(
                          status,
                          style: TextConstants.bodyText.copyWith(
                            fontWeight: FontWeight.w600,
                            color: status == 'Active'
                                ? ColorConstants.activeColor
                                : ColorConstants.errorColor,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VendorServiceViewScreen(),
                            ));
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryForeground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "See Details",
                            style:
                                TextConstants.buttonText.copyWith(fontSize: 14),
                          ),
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
  );
}

Widget searchWidget() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorConstants.highlightBlueLightest,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const TextField(
      textAlignVertical: TextAlignVertical.center, // Center the text vertically
      textAlign: TextAlign.start, // Align text to the start horizontally
      decoration: InputDecoration(
        border: InputBorder.none, // Remove the border
        hintText: "Search your services",
        hintStyle: TextConstants.bodyTextSecondary,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: ColorConstants.textSecondary, // Add appropriate color
        ),
        contentPadding: EdgeInsets.zero, // Adjust padding to center hint
      ),
      style: TextConstants.bodyText, // Style for the input text
      cursorColor: ColorConstants.textSecondary,
    ),
  );
}
