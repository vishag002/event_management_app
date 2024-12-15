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

  List<String> tabLabels = ['All', 'Unread'];

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
                color: Colors.black, style: BorderStyle.solid, width: 2),
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
  return ListView.builder(
    itemCount: 5, // Number of items in the list
    itemBuilder: (context, index) {
      return userChatList(context: context);
    },
  );
}

///////

Widget userChatList({required BuildContext context}) {
  return ListTile(
    leading: leadingWidget(),
    title: Text(
      "vendor name",
      style: TextConstants.bodyText
          .copyWith(height: 1, fontWeight: FontWeight.w600),
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: Text(
        "last message",
        style: TextConstants.bodyText.copyWith(
          height: 1,
          fontSize: 14,
        ),
      ),
    ),
    trailing: Icon(
      Icons.circle,
      size: 10,
      color: ColorConstants.primaryForeground,
    ),
  );
}

Widget leadingWidget() {
  return Container(
    width: 50,
    height: 50,
    decoration: const BoxDecoration(
        color: ColorConstants.primaryWhite,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
              "https://www.logodesign.net/logo/wedding-ring-with-hearts-381ld.png?nwm=1&nws=1&industry=event-planner&sf=&txt_keyword=All"),
          fit: BoxFit.cover,
        )),
  );
}
