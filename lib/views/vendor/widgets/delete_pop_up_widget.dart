import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurryDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onContinue;
  final VoidCallback? onCancel;

  const BlurryDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onContinue,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        // side: BorderSide(
        //     color: Theme.of(context).colorScheme.secondary, width: .1),
      ),
      contentPadding: EdgeInsets.zero,
      content: Stack(
        children: [
          // Main content container
          Container(
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * .27,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextConstants.subheading.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextConstants.bodyTextSecondary,
                    ),
                  ],
                ),
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height * .045,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: ColorConstants.primaryForeground,
                              width: 2,
                            )),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextConstants.buttonText.copyWith(
                              color: ColorConstants.primaryForeground,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: onContinue,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height * .045,
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryForeground,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextConstants.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Close icon in the top-right corner
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              icon: Icon(
                CupertinoIcons.clear_circled,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
