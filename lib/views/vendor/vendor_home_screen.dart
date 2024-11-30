import 'package:event_management_app/models/service_model.dart';
import 'package:event_management_app/models/services_demo_list.dart';
import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/vendor/vendor_add_service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/service_list_view_widget.dart';

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
                    "My Services",
                    style: TextConstants.appTitle,
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
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.fill,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 4,
                strokeAlign: 0),
          ),
          unselectedLabelStyle: TextConstants.subheading.copyWith(fontSize: 20),
          controller: _tabController,
          tabs: tabLabels.map((String label) => Tab(text: label)).toList(),
          labelColor: ColorConstants.textPrimary,
          labelStyle: TextConstants.subheading
              .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
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
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VendorAddServiceScreen(),
          //     ));
          Get.to(
            () => VendorAddServiceScreen(),
            transition: Transition.downToUp,
            fullscreenDialog: GetPlatform.isAndroid,
            duration: const Duration(milliseconds: 600),
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 20),
          // searchWidget(),
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
                      return serviceListView2(
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

Widget searchWidget() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: ColorConstants.lightGreyShade,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ColorConstants.textSecondary.withOpacity(.5),
          width: 1,
        )),
    child: TextField(
      textAlignVertical: TextAlignVertical.center, // Center the text vertically
      textAlign: TextAlign.start, // Align text to the start horizontally
      decoration: InputDecoration(
        border: InputBorder.none, // Remove the border
        hintText: "Search your services",
        hintStyle: TextConstants.bodyTextSecondary,
        prefixIcon: const Icon(
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
