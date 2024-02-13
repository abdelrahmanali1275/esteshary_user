import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naraakom/core/app_export.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({
    super.key, required this.txt,
  });
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        50.height,
        Lottie.asset('assets/lottie/no_result_lottie.json',width: 250.w),
        20.height,
        Text("لا توجد حجوزات $txt",style: CustomTextStyles.bodyLargeBlack900Bold20),
      ],
    );
  }
}