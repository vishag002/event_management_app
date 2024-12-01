import 'package:event_management_app/utilis/color_const.dart';
import 'package:flutter/material.dart';

class UserInboxScreen extends StatelessWidget {
  const UserInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Inbox Screen"),
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
    title: Text("data"),
    subtitle: Text("data"),
    trailing: Icon(Icons.circle),
  );
}

Widget leadingWidget() {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(
                "https://www.logodesign.net/logo/wedding-ring-with-hearts-381ld.png?nwm=1&nws=1&industry=event-planner&sf=&txt_keyword=All"))),
  );
}
