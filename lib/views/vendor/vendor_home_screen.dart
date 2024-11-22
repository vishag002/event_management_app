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

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  String selectedFilter = 'All';

  final List<ServiceModel> serviceItems = getServiceItems();

  // Filter the service items based on the selected filter
  List<ServiceModel> getFilteredItems() {
    if (selectedFilter == 'All') {
      return serviceItems;
    }
    return serviceItems
        .where((service) => service.status == selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "My Services",
                style: TextConstants.appTitle,
              ),
            ),
            const SizedBox(height: 30),
            searchWidget(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipWidget(
                  label: "All",
                  isSelected: selectedFilter == 'All',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                const SizedBox(width: 8),
                FilterChipWidget(
                  label: "Active",
                  isSelected: selectedFilter == 'Active',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'Active';
                    });
                  },
                ),
                const SizedBox(width: 8),
                FilterChipWidget(
                  label: "Pending",
                  isSelected: selectedFilter == 'Pending',
                  onSelected: (isSelected) {
                    setState(() {
                      selectedFilter = 'Pending';
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getFilteredItems().length,
                itemBuilder: (BuildContext context, int index) {
                  return ServiceListView(
                    context: context,
                    description: getFilteredItems()[index].description,
                    imageUrl: getFilteredItems()[index].imageUrl,
                    price: getFilteredItems()[index].price,
                    status: getFilteredItems()[index].status,
                    title: getFilteredItems()[index].title,
                  );
                },
              ),
            ),
          ],
        ),
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
              ));
        },
        child: Icon(
          CupertinoIcons.add,
          size: 35,
        ),
      ),
    );
  }
}

Widget FilterChipWidget({
  required String label,
  required bool isSelected,
  required void Function(bool) onSelected,
}) {
  return ChoiceChip(
    shadowColor: Colors.black,
    showCheckmark: false,
    backgroundColor: ColorConstants.highlightBlueLightest,
    selectedColor: ColorConstants.primaryForeground,
    label: Text(
      label,
      style: TextConstants.buttonTextSmall.copyWith(
        color: isSelected
            ? ColorConstants.backgroundPrimary
            : ColorConstants.primaryForeground,
      ),
    ),
    selected: isSelected, // Check if the chip is selected
    onSelected: onSelected, // Callback when the chip is selected
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30), // Border radius of 30
    ),
    padding: EdgeInsets.symmetric(
        vertical: 6, horizontal: 20), // Adjust height and padding
  );
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
  double aspectRatio = screenWidth > 400 ? 4.2 / 2 : 4.1 / 2;
  return AspectRatio(
    aspectRatio: aspectRatio,
    child: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity, // Ensure the width is finite
        decoration: BoxDecoration(
          color: ColorConstants.highlightBlue,
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
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover)),
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
                        Text("Price"),
                        Text("₹ ${price.toString()}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Status"),
                        Text(status),
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
