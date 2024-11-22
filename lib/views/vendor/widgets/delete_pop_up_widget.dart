import 'dart:ui';

import 'package:event_management_app/utilis/color_const.dart';
import 'package:event_management_app/utilis/text_const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    final h1 = MediaQuery.of(context).size.height * 0.2;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        // backgroundColor:const Color.fromARGB(255, 179, 175, 124).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  //color: Colors.red,
                  height: h1,
                  width: h1,
                  child: Lottie.asset(
                    'assets/lottie_files/delete_animation_lottie.json',
                  )),
              // Title and description
              Column(
                children: [
                  Text(
                    title,
                    style: TextConstants.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  //const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextConstants.bodyTextSecondary,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // Buttons
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: onCancel ??
                        () {
                          Navigator.pop(context);
                        },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorConstants.primaryForeground,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      side: BorderSide(
                        color: ColorConstants.primaryForeground,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextConstants.buttonText
                          .copyWith(color: ColorConstants.primaryForeground),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.primaryForeground,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextConstants.buttonText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
