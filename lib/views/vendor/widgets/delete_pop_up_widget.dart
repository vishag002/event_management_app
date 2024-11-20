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
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: ColorConstants.backgroundPrimary.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Placeholder for animation or icon
              SizedBox(
                  height: 150,
                  width: 150,
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
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextConstants.bodyTextSecondary,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: onCancel ??
                        () {
                          Navigator.pop(context);
                        },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorConstants.primaryBlack,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      side: BorderSide(
                        color: ColorConstants.primaryBlack,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextConstants.buttonText
                          .copyWith(color: ColorConstants.primaryBlack),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.primaryBlack,
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
