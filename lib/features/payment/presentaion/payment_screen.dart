import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.payment,
      ),
      body: PaymentScreenBody(),
    );
  }
}
