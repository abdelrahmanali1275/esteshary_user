import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../new_reservation/enter_doctor.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.not_listed_location_outlined,
          size: 150,
          color: AppColors.primary,
        ),
        Text(
          "لا يوجد لديك حجوزات سابقة",
          style: CustomTextStyles.bodyLargeBlack900Bold25,
        ),
        10.height,
        Text("يمكنك طلب استشارة من احد اطبائنا المعتمدين للحصول على مساعدة",
            style: CustomTextStyles.bodyLargeGray700,
            textAlign: TextAlign.center),
        50.height,
        CustomAppBottom(
          label: "عمل حجز جديد",
          onPressed: () {
            EnterDoctor().launch(context);
          },
        )
      ],
    );
  }
}