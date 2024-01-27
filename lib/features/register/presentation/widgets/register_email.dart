import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/register_cubit.dart';
class RegisterEmail extends StatelessWidget {
  const RegisterEmail({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.emailAddress,
      hintText: AppStrings.email,
      controller: cubit.email,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.pleaseEmail;
        } else if (value.validateEmail == false) {
          return AppStrings.pleaseEmailTrue;
        }
        return null;
      },
    );
  }
}