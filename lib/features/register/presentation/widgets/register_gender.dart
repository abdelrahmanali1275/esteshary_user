import 'package:flutter/material.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/register_cubit.dart';

class RegisterGender extends StatelessWidget {
  const RegisterGender({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField(
          isDense: true,
          dropdownColor: AppColors.whiteA700,
          borderRadius: BorderRadius.circular(13),
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13)),
          ),
          hint: Text("النوع",
              style: CustomTextStyles.bodyMediumBlack20001),
          items: [
            DropdownMenuItem(
              value: "ذكر",
              child: Text("ذكر",
                  style: CustomTextStyles.bodyMediumBlack20001),
            ),
            DropdownMenuItem(
              value: "انثي",
              child: Text("انثي",
                  style: CustomTextStyles.bodyMediumBlack20001),
            ),
          ],
          onChanged: (v) {
            cubit.gender = v!;
          }),
    );
  }
}