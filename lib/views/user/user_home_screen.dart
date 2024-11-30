import 'package:event_management_app/utilis/text_const.dart';
import 'package:event_management_app/views/user/widgets/explore_screen_list.dart';
import 'package:event_management_app/views/vendor/vendor_home_screen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "App Name",
            style: TextConstants.appTitle,
          ),
        ),
        body: Column(
          children: [
            Container(
                height: 80,
                width: double.infinity,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _chipContainer(label: "Marrage"),
                    _chipContainer(label: "Stage Decoration"),
                    _chipContainer(label: "Private shows"),
                  ],
                )),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: searchWidget(),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ExploreScreenList(),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget _chipContainer({required label}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey, //for selected item only
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(label),
    ),
  );
}
