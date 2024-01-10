import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';


class HomeScreenCircleWidget extends StatelessWidget {
  const HomeScreenCircleWidget({
    super.key,
    required this.text,
    required this.image,
    required this.function,
  });

  final String text;
  final String image;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: function,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 50,
            ),
            5.height,
            Text(
              text,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
         ),
          ],
        ),
      ),
    );
  }
}