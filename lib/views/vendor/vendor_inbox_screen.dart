import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorInboxScreen extends StatelessWidget {
  const VendorInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Messages",
                style: TextConstants.appTitle,
              ),
            ),
            const SizedBox(height: 30),
            searchWidget(),
            Expanded(child: MessageListWidget()),
          ],
        ),
      ),
    );
  }
}

///
Widget searchWidget() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorConstants.primaryBlack.withOpacity(.1),
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

/////
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
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(backgroundColor: ColorConstants.textSecondary),
        title: Text(
          "Name here",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Last message here...",
          style: TextStyle(color: Colors.grey[700]),
        ),
      );
    },
  );
}
