import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * .075,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.height * .07,
                  // backgroundImage: NetworkImage(
                  //   "https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg",
                  // ),
                ),
              ),
            ),
            Text(
              "Name",
              style: TextConstants.appTitle,
            ),
            Text(
              "verified",
              style: TextConstants.bodyTextSecondary,
            ),
            SizedBox(height: 20),
            Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature',
              style: TextConstants.bodyText,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.phone_circle,
                  size: 25,
                ),
                Text(
                  "12345689",
                  style: TextConstants.subheading,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 25,
                ),
                Text(
                  "ABC Road , Banglore",
                  style: TextConstants.subheading,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
