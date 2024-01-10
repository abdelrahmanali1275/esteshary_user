import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'custom_filled_button.dart';

class CustomTimeButton extends StatelessWidget {
  const CustomTimeButton({
    super.key,
    required this.text,
    required this.timeTextButton1,
    required this.timeTextButton2,
    required this.timeTextButton3,
  });

  final String text;
  final String timeTextButton1;
  final String timeTextButton2;
  final String timeTextButton3;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                children: [
                  20.height,
                  Chip(label: Text(AppStrings.timeAvailable),),
                  CustomFilledButton(
                    timeTextButton: timeTextButton1,
                  ),
                  10.height,
                  CustomFilledButton(
                    timeTextButton: timeTextButton2,
                  ),
                  10.height,
                  CustomFilledButton(
                    timeTextButton: timeTextButton3,
                  ),

                ],
              ),
            ),
          );
        },

        
        child: Text(
          "$text",
        )).animate().moveY();
  }
}


