import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorInboxScreen extends StatefulWidget {
  const VendorInboxScreen({super.key});

  @override
  State<VendorInboxScreen> createState() => _VendorInboxScreenState();
}

class _VendorInboxScreenState extends State<VendorInboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> tabLabels = ['All', 'Unread Messages'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLabels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Messages",
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
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: Colors.black, style: BorderStyle.solid, width: 4),
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
          // Tab 1: All Messages
          MessageListWidget(),
          // Tab 2: Unread Messages
          MessageListWidget(),
        ],
      ),
    );
  }
}

/// Search Widget
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

/// Demo ListView

Widget MessageListWidget() {
  return ListView.separated(
    itemCount: 10, // Number of items in the list
    separatorBuilder: (context, index) {
      return Divider(
        color: Colors.grey, // Divider color
        height: 1.5, // Height of the divider
        thickness: 0.5, // Thickness of the divider
        indent:
            50, // Optional, add indent if you want some padding before the divider
      );
    },
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          onTap: () {
            //todo : chat screen
          },
          leading: CircleAvatar(backgroundColor: ColorConstants.textSecondary),
          title: Text(
            "Name here",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Last message here...",
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      );
    },
  );
}
