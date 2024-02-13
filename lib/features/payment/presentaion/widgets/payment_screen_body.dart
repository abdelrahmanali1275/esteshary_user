import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/features/payment/presentaion/widgets/payment_alert_dialog.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.choosePaymentMethod,
            style: CustomTextStyles.bodyLargeBlack900Bold20,
          ),
          10.height,
          Text(
            AppStrings.activeYourSubscription,
            style: CustomTextStyles.titleLargeGrey500W400,
          ),
         30.height,
          CustomAppBottom(
            label: AppStrings.paymentByVodafoneCash,
            onPressed: () {
              showDialog(context: context, builder: (context) => PaymentAlertDialog(text: AppStrings.vodafoneCash,),);
            },
          ),
         30.height,
          CustomAppBottom(
            label: AppStrings.paymentByVisa,
            onPressed: () {
              showDialog(context: context, builder: (context) => PaymentAlertDialog(text: AppStrings.visa,),);
            },
          ),
        ],
      ),
    );
  }
}
