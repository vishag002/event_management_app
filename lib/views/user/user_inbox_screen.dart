import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';

class UserInboxScreen extends StatelessWidget {
  const UserInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => userChatList(context: context),
      ),
    );
  }
}

// User chat list widget
Widget userChatList({required BuildContext context}) {
  return ListTile(
    leading: leadingWidget(),
    title: Text(
      "vendor name",
      style: TextConstants.bodyText.copyWith(height: 1),
    ),
    subtitle: Text("last message"),
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
