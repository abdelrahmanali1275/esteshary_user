import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/home.dart';

class PaymentAlertDialog extends StatelessWidget {
  const PaymentAlertDialog({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: AppColors.whiteA700,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("عند الدفع بواسطة $text تاخذ الفاتورة لقطة شاشة وارسلها الي طلب المساعدة",style: CustomTextStyles.bodyLargeBlack900,),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              HomeScreen().launch(context);
            },
            child: Text(AppStrings.continue0,style: CustomTextStyles.bodyMediumPrimary)),
      ],
    );
  }
}


